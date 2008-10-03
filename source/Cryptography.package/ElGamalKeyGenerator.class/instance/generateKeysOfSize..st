private
generateKeysOfSize: numberOfBits
	p := PrimesFinder safePrimeOfSize: numberOfBits.
	alpha := self class generatorOfZp: p.
	a := SecureRandom picker nextInt: p-2