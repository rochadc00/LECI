import numpy
import random
from fractions import gcd
import base64



def get_primes(start, stop):
    """Return a list of prime numbers in ``range(start, stop)``."""
    if start >= stop:
        return []

    primes = [2]

    for n in range(3, stop + 1, 2):
        for p in primes:
            if n % p == 0:
                break
        else:
            primes.append(n)

    while primes and primes[0] < start:
        del primes[0]

    return primes


def are_relatively_prime(a, b):
    """Return ``True`` if ``a`` and ``b`` are two relatively prime numbers.

    Two numbers are relatively prime if they share no common factors,
    i.e. there is no integer (except 1) that divides both.
    """
    for n in range(2, min(a, b) + 1):
        if a % n == b % n == 0:
            return False
    return True

def egcd(aa, bb):
    lastremainder, remainder = abs(aa), abs(bb)
    x, lastx, y, lasty = 0, 1, 1, 0
    while remainder:
        lastremainder, (quotient, remainder) = remainder, divmod(lastremainder, remainder)
        x, lastx = lastx - quotient*x, x
        y, lasty = lasty - quotient*y, y
    return lastremainder, lastx * (-1 if aa < 0 else 1), lasty * (-1 if bb < 0 else 1)

def modinv(a, m):
	g, x, y = egcd(a, m)
	if g!=1:
		raise Exception ('No modular inverse')
	return x%m

length = 30

# First step: find a number ``n`` which is the product of two prime
# numbers (``p`` and ``q``). ``n`` must have the number of bits specified
# by ``length``, therefore it must be in ``range(n_min, n_max + 1)``.
n_min = 1 << (length - 1)
n_max = (1 << length) - 1

# The key is stronger if ``p`` and ``q`` have similar bit length. We
# choose two prime numbers in ``range(start, stop)`` so that the
# difference of bit lengths is at most 2.
start = 1 << (length // 2 - 1)
stop = 1 << (length // 2 + 1)
primes = get_primes(start, stop)

# Now that we have a list of prime number candidates, randomly select
# two so that their product is in ``range(n_min, n_max + 1)``.
while primes:
    p = random.choice(primes)
    primes.remove(p)
    q_candidates = [q for q in primes
                    if n_min <= p * q <= n_max]
    if q_candidates:
        q = random.choice(q_candidates)
        break
else:
    raise AssertionError("cannot find 'p' and 'q' for a key of "
                     "length={!r}".format(length))

print p
print q

n = p*q
print n

z = (p-1) * (q-1)
print z

e = 2

while e<z:
	if gcd(e, z)==1:
		break
	e+=1

print e

d = modinv(e, z)


print "Public Key: "+str(n)+", "+str(e)
print "Private Key: "+str(n)+", "+str(d)


####### Cipher #########

text = 456789012
print text
c = pow(text, e, n)
print c

####### Decipher #########
text = pow(c, d, n)
print text