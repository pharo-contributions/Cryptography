initialization
initializePrimes: n
	| primes2000 last p |
	primes2000 _ self class primes2000.
	n = 2000
		ifTrue:
			[primes _ primes2000.
			^ self].
	n < 2000
		ifTrue:
			[last _ primes2000 findLast: [:prime | prime <= n].
			primes _ primes2000 copyFrom: 1 to: last.
			^ self].
	primes _ (OrderedCollection new: n // 2) addAll: primes2000; yourself.
	p _ primes2000 last + 2.
	[p <= n]
		whileTrue:
			[primes detect: [:one | p \\ one = 0] ifNone: [primes add: p].
			p _ p + 2].
	primes _ primes asArray
