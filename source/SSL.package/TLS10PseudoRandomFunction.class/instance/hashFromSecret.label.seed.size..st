recursive
hashFromSecret: secret label: label seed: seed size: size

	| s1 s2 mixedSeed md5Block shaBlock |
	s1 := secret copyFrom: 1 to: (secret size + 1 // 2).
	s2 := secret copyFrom: (secret size // 2) + 1 to: secret size.
	mixedSeed := label asByteArray, seed.
	md5Block := self expansionFunctionMD5: s1 seed: mixedSeed size: size.
	shaBlock := self expansionFunctionSHA: s2 seed: mixedSeed size: size.
	^ md5Block bitXor: shaBlock