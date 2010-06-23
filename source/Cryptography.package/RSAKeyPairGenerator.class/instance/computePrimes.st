private
computePrimes
	[p := self findPrime. p - 1 \\ self e = 0] whileTrue.
	[q := self findPrime. p - 1 * (q - 1) \\ self e = 0] whileTrue