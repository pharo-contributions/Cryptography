arithmetic
+= anInteger
	| s r |
	s _ true.
	1 to: primes size do: [:i |
		r _ (residues at: i) + anInteger \\ (primes at: i).
		residues at: i put: r.
		r isZero ifTrue: [s _ false]].
	satisfied _ s