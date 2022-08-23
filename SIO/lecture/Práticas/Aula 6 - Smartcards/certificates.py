import jks
import pkcs11
from pkcs11 import *
from OpenSSL import crypto
import getpass
import os

_ASN1 = crypto.FILETYPE_ASN1

keystore = jks.KeyStore.load('certificates/CC_KS', 'password')
lib = pkcs11.lib("/usr/local/lib/libpteidpkcs11.so")
tokens = lib.get_tokens()
token = None

for t in tokens:
	token = t
	break

# With the old middleware there are no trusted anchors...

trusted_anchors = []
intermediate_certificates = []

path = "newcccertificates"
#path = "oldcccertificates"

# Save all certificates

def save_certificates(path):
	with token.open() as session:
		i=0
		for cert in session.get_objects({
			Attribute.CLASS: ObjectClass.CERTIFICATE,
			}):

			t = crypto.load_certificate(_ASN1, cert[Attribute.VALUE])
			
			open(path+"/"+str(i)+".cer", "wb").write(
				crypto.dump_certificate (_ASN1, t))
			i += 1


def get_cert_from_card():
	trusted_anchors = []
	intermediate_certificates = []

	with token.open() as session:

		for cert in session.get_objects({
			Attribute.CLASS: ObjectClass.CERTIFICATE,
			}):

			t = crypto.load_certificate(_ASN1, cert[Attribute.VALUE])
			
			subject = t.get_subject().CN
			issuer = t.get_issuer().CN

			if(subject==issuer):	
				trusted_anchors += [t]
			else:
				intermediate_certificates += [t]

	return trusted_anchors, intermediate_certificates


def get_saved_cert_cart(path):
	trusted_anchors = []
	intermediate_certificates = []

	for file_cert in os.listdir(os.path.join(os.getcwd(), path)):
		oc = open(os.path.join(os.path.join(os.getcwd(), path),file_cert), "rb").read()
		t = crypto.load_certificate(_ASN1, oc)

		subject = t.get_subject().CN
		issuer = t.get_issuer().CN

		if(subject==issuer):
			trusted_anchors += [t]
		else:
			intermediate_certificates += [t]

	return trusted_anchors, intermediate_certificates

def get_cert_keystore():
	trusted_anchors = []
	intermediate_certificates = []

	for alias, certificate in keystore.certs.items():

		t = crypto.load_certificate(_ASN1, certificate.cert)

		subject = t.get_subject().CN
		issuer = t.get_issuer().CN

		if(subject==issuer):
			trusted_anchors += [t]
		else:
			intermediate_certificates += [t]

	return trusted_anchors, intermediate_certificates



# LEFT: Check if is not on the CRL
# LEFT: Verify with public key
def getCertificatePath(certificate, trusted_anchors, intermediate_certificates, path={}):

	#print(certificate.get_notBefore())
	#print(certificate.get_notAfter())
	#print(certificate.get_pubkey())
	# Get the digest
	#alg = certificate.get_signature_algorithm()
	#dig = certificate.digest(alg.decode('utf-8'))


	issuer = certificate.get_issuer().CN
	subject = certificate.get_subject().CN

	# Check if it has expired
	if(certificate.has_expired()):
		return None

	if(path=={}):
		path[subject] = issuer
				 
	for c in intermediate_certificates:
		# Check if the issuer of the certificate is the subject of the parent
		parent_issuer = c.get_issuer().CN
		parent_subject = c.get_subject().CN
		if(subject != parent_subject and issuer == parent_subject):

			# print(certificate.verify(c.get_pubkey()))
			path[issuer] = parent_issuer
			path = getCertificatePath(c, trusted_anchors, intermediate_certificates, path)
			return path

	# With the old middleware there are no trusted anchors...
	for trusted in trusted_anchors:
		parent_issuer = trusted.get_issuer().CN
		parent_subject = trusted.get_subject().CN

		if(subject == parent_subject):

			return path

	# With the old middleware we need this return...
	return path

def verifyCertificateChain(certificate, trusted_certs):
	try:
		store = crypto.X509Store()

		# Assuming the certificates are in PEM format in a trusted_certs list
		for _cert in trusted_certs:
			store.add_cert(_cert)

		# Create a certificate context using the store and the downloaded certificate
		store_ctx = crypto.X509StoreContext(store, certificate)

		# Verify the certificate, returns None if it can validate the certificate
		store_ctx.verify_certificate()

		return True

	except Exception as e:
		print(e)
		return False


#print("*****CERT*****")
#for cert in intermediate_certificates:
#	print(getCertificatePath(cert, trusted_anchors, intermediate_certificates))

#save_certificates(path)

trusted_anchors1, intermediate_certificates1 = get_saved_cert_cart(path)
trusted_anchors2, intermediate_certificates2 = get_cert_keystore()

for t in trusted_anchors1+trusted_anchors2:
	if t.get_subject().CN not in [ce.get_subject().CN for ce in trusted_anchors]:
		trusted_anchors += [t]

for i in intermediate_certificates1+intermediate_certificates2:
	if i.get_subject().CN not in [ce.get_subject().CN for ce in intermediate_certificates]:
		intermediate_certificates += [i]

print(getCertificatePath(intermediate_certificates[0], trusted_anchors, intermediate_certificates))
print(intermediate_certificates[0].get_subject().CN)
print(verifyCertificateChain(intermediate_certificates[0], intermediate_certificates[1:]))
