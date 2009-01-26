initialization
setupPrimeOfSize: bits
	prime _ PrimesFinder safePrimeOfSize: bits.
	generator _ ElGamalKeyGenerator generatorOfZp: prime