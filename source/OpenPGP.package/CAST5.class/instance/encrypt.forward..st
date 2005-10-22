encryption/decryption
encrypt: anInteger forward: aBoolean
	| rLast lLast mask32 km kr n t s1ia s2ib s3ic s4id maxRound round |
	mask32 := 16rFFFFFFFF.
	lLast := ThirtyTwoBitRegister new load: (anInteger bitShift: -32).
	rLast := ThirtyTwoBitRegister new load: (anInteger bitAnd: mask32).
	s1ia := ThirtyTwoBitRegister new.
	s2ib := ThirtyTwoBitRegister new.
	s3ic := ThirtyTwoBitRegister new.
	s4id := ThirtyTwoBitRegister new.
	maxRound := shortKey ifTrue: [12] ifFalse: [16].
	1 to: maxRound do: [:i |
		round := aBoolean ifTrue: [i] ifFalse: [maxRound+1-i].
		km := (k at: round) copy.
		kr := k at: round+16.
		n := round \\ 3.
		n = 1
			ifTrue: [km += rLast]
			ifFalse: [n = 2
				ifTrue: [km bitXor: rLast]
				ifFalse: [km -= rLast]].
		km leftRotateBy: kr.
		s1ia := (S1 at: km d0+1) copy.
		s2ib := (S2 at: km d1+1).
		s3ic := (S3 at: km d2+1).
		s4id := (S4 at: km d3+1).
		n = 1
			ifTrue: [(s1ia bitXor: s2ib) -= s3ic += s4id]
			ifFalse: [n = 2
				ifTrue: [s1ia -= s2ib += s3ic bitXor: s4id]
				ifFalse: [(s1ia += s2ib bitXor: s3ic) -= s4id]].
		t := rLast.
		rLast := lLast.
		rLast bitXor: s1ia.
		lLast := t].
	^lLast asInteger + (rLast asInteger bitShift: 32)