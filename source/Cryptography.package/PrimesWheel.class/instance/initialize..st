initialization
initialize: n
	self initializePrimes: n.
	residues _ (Array new: primes size) atAllPut: 0.
	satisfied _ false