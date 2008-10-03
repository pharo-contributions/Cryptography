initialization
setupPrimeOfSize: bits
	prime := PrimesFinder safePrimeOfSize: bits.
	generator := ElGamalKeyGenerator generatorOfZp: prime