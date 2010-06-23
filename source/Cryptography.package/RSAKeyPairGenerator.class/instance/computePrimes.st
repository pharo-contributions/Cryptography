private
computePrimes
	[p _ self findPrime. p - 1 \\ self e = 0] whileTrue.
	[q _ self findPrime. p - 1 * (q - 1) \\ self e = 0] whileTrue