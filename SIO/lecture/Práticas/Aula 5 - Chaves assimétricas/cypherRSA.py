from Crypto import Random
from Crypto.Cipher import AES, PKCS1_OAEP
from Crypto.PublicKey import RSA
import sys

# Arguments
public_key_file = sys.argv[1]
cleartext_file = sys.argv[2]
ciphertext_file = sys.argv[3]

# Read public key
fpublick = open(public_key_file, 'r')
publickey = fpublick.read()
fpublick.close()

# Read clear text
fcleart = open(cleartext_file, 'r')
cleartext = fcleart.read()
fcleart.close()

publKey = RSA.importKey(publickey)

cipher = PKCS1_OAEP.new(publKey)
msg = cipher.encrypt(cleartext)
print msg

fciphertext = open(ciphertext_file, 'w')
fciphertext.write(str(msg))
fciphertext.close()
