initialize-release
shutDown
	self privateKeyKey ifNotNilDo: [:a | a destroy].
	self privateKeyKey: nil.
	prime1_p destroy.
	prime2_q destroy.
	exp1_dmodpminus1 destroy.
	exp2_dmodqminus1 destroy.
	coefficient_invqmodp destroy.
	privateExponent_d destroy.
	
	