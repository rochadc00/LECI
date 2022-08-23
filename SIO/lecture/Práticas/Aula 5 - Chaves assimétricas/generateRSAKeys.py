from Crypto import Random
from Crypto.PublicKey import RSA
import sys

key_size = int(sys.argv[1])
public_key_file = sys.argv[2]
private_key_file = sys.argv[3]

random_generator = Random.new().read
key = RSA.generate(key_size, random_generator) # Key size must be multiple of 256 and >= 1024

publickey = key.publickey().exportKey()
print publickey
privatekey = key.exportKey()
print privatekey

fprivate = open(private_key_file, 'w')
fprivate.write(str(privatekey))
fprivate.close()

fpublic = open(public_key_file, 'w')
fpublic.write(str(publickey))
fpublic.close()
