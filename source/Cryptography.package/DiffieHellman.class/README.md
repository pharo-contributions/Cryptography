I represent the basic version of the Diffie-Hellman key agreement. 
See Handbook of Applied Cryptography, Ch. 12, p. 516

One time setup:
* a safe prime p and a generator alpha of Zp* are published.

Protocol actions:
* Alice chooses a random secret x between 1 and p-2.
* Alice sends Bob message alpha^x mod p.
* Bob chooses a random secret y between 1 and p-2.
* Bob sends Alice message alpha^y mod p.
* Alice receives alpha^y and computes the shared key:
	K = (alpha^y)^x mod p.
* Bob receives alpha^x and computes the shared key:
	K = (alpha^x)^y mod p.

Example from testCase:
| alice bob fromAlice fromBob k1 k2 |
alice _ DiffieHellman bits: 15.
bob _ DiffieHellman prime: alice prime generator: alice generator.
fromAlice _ alice sendMessage.
fromBob _ bob sendMessage.
k1 _ alice receiveMessage: fromBob.
k2 _ bob receiveMessage: fromAlice.
self assert: k1 = k2
