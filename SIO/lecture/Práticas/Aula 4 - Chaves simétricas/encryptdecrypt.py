from Crypto.Cipher import DES3, AES, DES
from Crypto import Random
import os
import sys

inputf = sys.argv[1]
outputf = sys.argv[2]
alg = sys.argv[3]
mode = int(sys.argv[4])
encrypt = sys.argv[5]

# 16 or 24 bytes long if is DES3
# 16, 24 or 32 bytes long if is AES
key = b'Sixteen byte key'
intermediate = 'to_enc.enc'


'''
AES and DES3 available modes:
1 - MODE_ECB
2 - MODE_CBC
3 - MODE_CFB
4 - MODE_PGP
5 - MODE_OFB
6 - MODE_CTR
7 - MODE_OPENPGP
'''
des3_mode = aes_mode = mode


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
					length = 16 - len(chunk) % 16
					chunk += chr(length) * length
				output.write(cipher.encrypt(chunk))



def decrypt_file(input, output, chunk_size, key, iv, alg, mode):

	data = ""

	if (alg=='DES'):
		cipher = DES3.new(key, mode, iv)
	elif (alg=='AES'):
		cipher = AES.new(key, mode, iv)
	
	with open (input, 'r') as in_file:
			while True:
				chunk = in_file.read(chunk_size)
				if len(chunk) == 0:
					break
				data = cipher.decrypt(chunk)

	with open(output, 'w') as output:
		output.write(data[0:-ord(data[-1])])



if(alg=="DES"):
	if (encrypt=="encrypt"):
		with open("iv", 'w') as output:
			output.write(iv)
		encrypt_file(inputf, outputf, DES3.block_size, key, iv, alg, des3_mode)
	elif(encrypt=="decrypt"):
		with open("iv", 'rv') as input:
			iv = input.read(DES3.block_size)
		decrypt_file(inputf, outputf, DES3.block_size, key, iv, alg, des3_mode)

elif(alg=="AES"):
	if (encrypt=="encrypt"):
		with open("iv", 'w') as output:
			output.write(iv)
		encrypt_file(inputf, outputf, AES.block_size, key, iv, alg, aes_mode)
	elif(encrypt=="decrypt"):
		with open("iv", 'rv') as input:
			iv = input.read(AES.block_size)
		decrypt_file(inputf, outputf, AES.block_size, key, iv, alg, aes_mode)

