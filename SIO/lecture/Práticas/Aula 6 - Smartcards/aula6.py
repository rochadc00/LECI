import PyKCS11
import os


# Initialise our PKCS#11 library
pkcs11 = PyKCS11.PyKCS11Lib()
lib_path = "/usr/local/lib/libpteidpkcs11.so"
pkcs11.load(lib_path)
info = pkcs11.getInfo()
print (info)

slots = pkcs11.getSlotList()
print (slots)

slot = slots[0]

slotInfo = pkcs11.getSlotInfo(slot)
tokenInfo = pkcs11.getTokenInfo(slot)


print ("Slot:\n" + str(slotInfo))
print ("Token: \n" + str(tokenInfo))


session = pkcs11.openSession(slot)

pin = "..."

if pin:
	print ("(using pin: %s)" % pin)
	session.login(pin)
	print ("Login done")
else:
	print ()

print ("Session info: " + str(session.getSessionInfo()))

objects = session.findObjects()

for obj in objects:
	#print (obj)
	pass

certificate = session.findObjects([(PyKCS11.CKA_CLASS, PyKCS11.CKO_CERTIFICATE)])
print(certificate)



if pin:
	session.logout()
