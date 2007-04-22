private
generateKeysOfSize: numberOfBits
	p _ PrimesFinder safePrimeOfSize: numberOfBits.
	alpha _ self class generatorOfZp: p.
	a _ SecureRandom picker nextInt: p-2