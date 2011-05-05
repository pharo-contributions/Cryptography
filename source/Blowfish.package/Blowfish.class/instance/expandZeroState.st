as yet unclassified
expandZeroState
	| dataL dataR s0Test s1Test s2Test s3Test  pTest|
	current := 1.
pTest:=piArray copy.
	(1 to: rounds + 2)
		do: [ :each | piArray at: each put: ((piArray at: each) bitXor: (self stream2word: key)) ].

"xl := 16r0.
xr := 16r0."
xl:=#[0 0 0 0] unsignedLongAt: 1 bigEndian:   true.
xr:=#[0 0 0 0] unsignedLongAt: 1 bigEndian:   true.
pTest:=piArray copy.
		(1 to: rounds + 2 by: 2)
		do: [ :each | 		
			self encipher.
					piArray at: each put: xl copy.
					piArray at: each+1 put: xr copy.].

s0Test :=s0 copy.
s1Test :=s1 copy.
s2Test :=s2 copy.
s3Test :=s3 copy.



		(1 to:256 by:2)
		do: [ :each | self encipher.
					s0 at: each put: xl copy.
					s0 at: each+1 put: xr copy.
					].

		(1 to:256 by:2)
		do: [ :each | self encipher.
					s1 at: each put: xl copy.
					s1 at: each+1 put: xr copy.].

		(1 to:256 by:2)
		do: [ :each | self encipher.
					s2 at: each put: xl copy.
					s2 at: each+1 put: xr copy.].

		(1 to:256 by:2)
		do: [ :each | self encipher.
					s3 at: each put: xl copy.
					s3 at: each+1 put: xr copy.].
			
"	s0Test:= s0 select:[:each | each asByteArray size >4].
	s1Test:= s1 select:[:each | each asByteArray size >4].
	s2Test:= s2 select:[:each | each asByteArray size >4].
	s3Test:= s3 select:[:each | each asByteArray size >4].
	(s0Test size + s1Test size + s2Test size + s3Test size) >0 ifTrue:[self halt]."