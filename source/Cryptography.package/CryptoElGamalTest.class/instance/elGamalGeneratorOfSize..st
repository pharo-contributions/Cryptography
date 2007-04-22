ElGamal
elGamalGeneratorOfSize: bits
	^ elGamalGenerators 
		at: bits
		ifAbsent:
			[ "We should at least run the generator code to be sure it gets tested."
			ElGamalKeyGenerator new generateKeysOfSize: bits ]