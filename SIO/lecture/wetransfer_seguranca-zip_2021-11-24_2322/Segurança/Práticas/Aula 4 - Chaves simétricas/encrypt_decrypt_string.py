from Crypto.Cipher import DES3
from Crypto import Random
import os
import sys

## Encrypt and Decrypt with DES
key = b'Sixteen byte key'
iv = Random.new().read(DES3.block_size)

cipher = DES3.new(key, DES3.MODE_OFB, iv)
plaintext = "attackaa"
msg = cipher.encrypt(plaintext)
print(plaintext)
print(msg)

cipher = DES3.new(key, DES3.MODE_OFB, iv)
print(cipher.decrypt(msg))