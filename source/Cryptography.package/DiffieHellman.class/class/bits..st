instance creation
bits: anInteger
	| prime generator |
	prime := PrimesFinder safePrimeOfSize: anInteger.
	generator := ElGamalKeyGenerator generatorOfZp: prime.
	^ self prime: prime generator: generator