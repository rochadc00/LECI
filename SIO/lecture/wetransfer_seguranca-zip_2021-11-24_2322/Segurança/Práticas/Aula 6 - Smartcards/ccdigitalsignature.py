from PyKCS11 import *
import os
import binascii
import getpass
import OpenSSL

# Initialise our PKCS#11 library
pkcs11 = PyKCS11.PyKCS11Lib()
lib_path = "/usr/local/lib/libpteidpkcs11.so"
#lib_path = "/usr/lib/x86_64-linux-gnu/opensc-pkcs11.so"
pkcs11.load(lib_path)

slot = pkcs11.getSlotList(tokenPresent=True)[0]

session = pkcs11.openSession(slot, CKF_SERIAL_SESSION | CKF_RW_SESSION)

pin = getpass.getpass("Signature PIN: ")

session.login(pin)

labelID = "CITIZEN AUTHENTICATION"
labelID2 = "CITIZEN SIGNATURE"

toSign = "4848"

# objects = session.findObjects([(PyKCS11.CKA_CLASS, PyKCS11.CKO_CERTIFICATE)])
# all_attributes = [PyKCS11.CKA_SUBJECT, PyKCS11.CKA_VALUE, PyKCS11.CKA_ISSUER, PyKCS11.CKA_CERTIFICATE_CATEGORY, PyKCS11.CKA_END_DATE]
# for obj in objects:
# 	print(1)
# 	attributes = session.getAttributeValue(obj, all_attributes)
# 	attrDict = dict(list(zip(all_attributes, attributes)))
# 	x509 = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_ASN1, str(bytearray(attrDict[PyKCS11.CKA_VALUE])))
# 	print(x509.get_issuer().CN)
# 	print(x509.get_subject().CN)

# find private key and compute signature
privKey = session.findObjects([(CKA_CLASS, CKO_PRIVATE_KEY), (CKA_LABEL, labelID+" KEY")])[0]
signMechanism = PyKCS11.Mechanism(PyKCS11.CKM_SHA1_RSA_PKCS, None)
signature = session.sign(privKey, toSign, signMechanism)
print("\nsignature: {}".format(binascii.hexlify(bytearray(signature))))

pubKey = session.findObjects([(CKA_CLASS, CKO_PUBLIC_KEY)])[0]
signMechanism = PyKCS11.Mechanism(PyKCS11.CKM_SHA1_RSA_PKCS, None)
verify = session.verify(pubKey, toSign, signMechanism)


#cert = session.findObjects([(CKA_CLASS, CKO_CERTIFICATE), (CKA_LABEL, labelID+" CERTIFICATE")])[0]
#attributes = session.getAttributeValue(cert, [CKA_VALUE])

# Python 2 ONLY!
#certificate = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_ASN1,
#                str(bytearray(attributes[0])))

# Python 3 ONLY!
#certificate = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_ASN1,
#                bytes(attributes[0]))


#OpenSSL.crypto.verify(certificate, bytes(signature), toSign, 'sha1WithRSAEncryption')
#print("VERIFIED!")


# logout
session.logout()
session.closeSession()

