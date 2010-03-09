initialization
initialize: n
	self initializePrimes: n.
	residues := (Array new: primes size) atAllPut: 0.
	satisfied := false