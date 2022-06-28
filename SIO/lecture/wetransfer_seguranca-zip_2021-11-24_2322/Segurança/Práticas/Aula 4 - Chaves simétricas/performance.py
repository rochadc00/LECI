import time
from Crypto import Random
from Crypto.Cipher import DES3, AES, DES, ARC4, Blowfish
from Crypto.Util import Counter
from Crypto.Hash import SHA

def encrypt_Des(text, iv):
	key = b'Sixteen byte key'
	cipher = DES3.new(key, DES3.MODE_OFB, iv)
	msg = cipher.encrypt(text)

def encrypt_Aes(text, iv):
	key = b'Sixteen byte key'
	cipher = AES.new(key, AES.MODE_OFB, iv)
	msg = cipher.encrypt(text)

def encrypt_Desede(text, ctr):
	key = b'eight by'
	cipher = DES.new(key, DES.MODE_CTR, counter=ctr)
	msg = cipher.encrypt(text)

def encrypt_Arc4(text, nonce):
	key = b'Sixteen byte key'
	tempkey = SHA.new(key+nonce).digest()
	cipher = ARC4.new(tempkey)
	msg = cipher.encrypt(text)

def encrypt_blowfish(text, iv):
	key = b'Sixteen byte key'
	cipher = Blowfish.new(key, Blowfish.MODE_CBC, iv)
	msg = cipher.encrypt(text)

keys_8 = []


keys = []
i=16
while i<8192:
	keys.append(Random.new().read(i))
	i+=16

## DES
iv = Random.new().read(DES3.block_size)

start_time = time.time()
for k in keys:
	encrypt_Des(k, iv)
elapsed_time = time.time() - start_time
print "DES: "+str(elapsed_time)

## AES
iv = Random.new().read(AES.block_size)

start_time = time.time()
for k in keys:
	encrypt_Aes(k, iv)
elapsed_time = time.time() - start_time
print "AES: "+str(elapsed_time)

## TDES
nonce = Random.new().read(DES.block_size/2)
ctr = Counter.new(DES.block_size*8/2, prefix=nonce)
start_time = time.time()
for k in keys:
	encrypt_Desede(k, ctr)
elapsed_time = time.time() - start_time
print "TDes: "+str(elapsed_time)

## ARC4
nonce = Random.new().read(16)
start_time = time.time()
for k in keys:
	encrypt_Arc4(k, nonce)
elapsed_time = time.time() - start_time
print "ARC4: "+str(elapsed_time)


## Blowfish
iv = Random.new().read(Blowfish.block_size)
for k in keys:
	encrypt_blowfish(k, iv)
elapsed_time = time.time() - start_time
print "Blowfish: "+str(elapsed_time)