from Crypto.Cipher import DES3, AES, DES
from Crypto import Random
import os
import sys

# 16 or 24 bytes long if is DES3
# 16, 24 or 32 bytes long if is AES
key1 = b'Sixteen byte key'
key2 = b'one day i went t'
key3 = b'o the shopping .'

iv1 = Random.new().read(DES3.block_size) # 8 byte block size
iv2 = Random.new().read(DES3.block_size) # 8 byte block size
iv3 = Random.new().read(DES3.block_size) # 8 byte block size

cipher1 = DES3.new(key1, DES3.MODE_OFB, iv1)
cipher2 = DES3.new(key2, DES3.MODE_OFB, iv2)
cipher3 = DES3.new(key3, DES3.MODE_OFB, iv3)

plaintext = b'sona si latine loqueris '

t1 = cipher1.encrypt(plaintext)
t2 = cipher2.decrypt(t1)
encripted = cipher3.encrypt(t2)

print encripted

cipher1 = DES3.new(key1, DES3.MODE_OFB, iv1)
cipher2 = DES3.new(key2, DES3.MODE_OFB, iv2)
cipher3 = DES3.new(key3, DES3.MODE_OFB, iv3)


t3 = cipher3.decrypt(encripted)
t4 = cipher2.encrypt(t3)
decrypted = cipher1.decrypt(t4)

print decrypted