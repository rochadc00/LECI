from Crypto import Random
from Crypto.Cipher import PKCS1_OAEP
from Crypto.PublicKey import RSA
import sys

private_key_file = sys.argv[1]
ciphertext_file = sys.argv[2]
cleartext_file = sys.argv[3]

fprivatek = open(private_key_file, 'r')
privatekey = fprivatek.read()
fprivatek.close()

fciphert = open(ciphertext_file, 'r')
ciphertext = fciphert.read()
fciphert.close()

pKey = RSA.importKey(privatekey)
cipher = PKCS1_OAEP.new(pKey)
msg = cipher.decrypt(ciphertext)
print msg

fcleartext = open(cleartext_file, 'w')
fcleartext.write(msg)
fcleartext.close()