instance creation
bits: anInteger
	| prime generator |
	prime _ PrimesFinder safePrimeOfSize: anInteger.
	generator _ ElGamalKeyGenerator generatorOfZp: prime.
	^ self prime: prime generator: generator