as yet unclassified
decipher
	| xL xR temp |
	xL := xl copy.
	xR := xr copy.
	xL := xL bitXor: (piArray at: 18).
	(17 to: 2 by: -2)
		do: [ :each | 
			xR := self calculateBlfRndFor: xR with: xL andPiAt: each.
			xL := self calculateBlfRndFor: xL with: xR andPiAt: each - 1 ].
	xl := xR bitXor: (piArray at: 1).
	xr := xL