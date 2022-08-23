from Crypto.Cipher import DES3, AES, DES
from Crypto import Random
import os
import sys

# 16 or 24 bytes long if is DES3 (128 or 192 bits)
# 16, 24 or 32 bytes long if is AES (128, 192 or 256 bits)
key = b'Sixteen byte key'
inputf = 'file.txt'
intermediate = 'to_enc.enc'
output = 'to_enc.dec'
alg = 'AES' # AES or DES

'''
AES and DES3 available modes:
MODE_ECB
MODE_CBC
MODE_CFB
MODE_PGP
MODE_OFB
MODE_CTR
MODE_OPENPGP
'''
des3_mode = DES3.MODE_OFB
aes_mode = AES.MODE_OFB


if (alg=='DES'):
	iv = Random.new().read(DES3.block_size) # 8 byte block size
	# or iv = 8* '\x00'

elif (alg=='AES'):
	iv = Random.new().read(AES.block_size) # 16 byte block size
	# or iv = 16 * '\x00'

else:
	raise Exception


def encrypt_file(input, output, chunk_size, key, iv, alg, mode):
	if (alg=='DES'):
		cipher = DES3.new(key, mode, iv)
	elif (alg=='AES'):
		cipher = AES.new(key, mode, iv)
	else:
		raise Exception

	with open (input, 'r') as in_file:
		with open(output, 'w') as output:
			while True:
				chunk = in_file.read(chunk_size)
				if len(chunk) == 0:
					break
				elif len(chunk) % 16 != 0:
					chunk += ' ' * (16 - len(chunk) % 16)
				output.write(cipher.encrypt(chunk))


def decrypt_file(input, output, chunk_size, key, iv, alg, mode):
	if (alg=='DES'):
		cipher = DES3.new(key, mode, iv)
	elif (alg=='AES'):
		cipher = AES.new(key, mode, iv)
	
	with open (input, 'r') as in_file:
		with open(output, 'w') as output:
			while True:
				chunk = in_file.read(chunk_size)
				if len(chunk) == 0:
					break
				output.write(cipher.decrypt(chunk))


if(alg=="DES"):
	encrypt_file(inputf, intermediate, DES3.block_size, key, iv, alg, des3_mode)
	decrypt_file(intermediate, output, DES3.block_size, key, iv, alg, des3_mode)

elif(alg=="AES"):
	encrypt_file(inputf, intermediate, AES.block_size, key, iv, alg, aes_mode)
	decrypt_file(intermediate, output, AES.block_size, key, iv, alg, aes_mode)
