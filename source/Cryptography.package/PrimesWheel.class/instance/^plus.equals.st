arithmetic
+= anInteger
	| s r |
	s := true.
	1 to: primes size do: [:i |
		r := (residues at: i) + anInteger \\ (primes at: i).
		residues at: i put: r.
		r isZero ifTrue: [s := false]].
	satisfied := s