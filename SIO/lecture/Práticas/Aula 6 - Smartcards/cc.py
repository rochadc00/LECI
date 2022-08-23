import os
import pkcs11
from pkcs11 import *
import getpass
import OpenSSL

print('Getting token...')

lib = pkcs11.lib('/usr/local/lib/libpteidpkcs11.so')

tokens = lib.get_tokens()
token = None

for t in tokens:
	token = t
	break


data = b'INPUT DATA'

signature = None
objs = None
priv = None
obj = None

with token.open() as session:

	objs = session.get_objects({Attribute.CLASS: ObjectClass.PRIVATE_KEY})
	priv = None	

	for obj in objs:
		if("AUTH" in str(obj).upper()):
			priv = obj
			break

	objs = None

	if(priv is None):
		print("No Authentication Public Key Found.")

	print('Got Private Key.')

	signature = priv.sign(data, mechanism=pkcs11.Mechanism.SHA1_RSA_PKCS)
	print(signature)


with token.open() as session:

	objs = session.get_objects({Attribute.CLASS: ObjectClass.PUBLIC_KEY})
	pubKey = None

	for obj in objs:
		if "AUTH" in str(obj).upper():
			pubKey = obj
			break

	objs = None

	if(pubKey is None):
		print("No Authentication Public Key Found.")

	print(pubKey.verify(data, signature, mechanism=pkcs11.Mechanism.SHA1_RSA_PKCS))

