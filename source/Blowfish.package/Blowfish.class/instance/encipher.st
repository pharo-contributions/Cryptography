as yet unclassified
encipher
	| xL xR temp |
	xL := xl copy.
	xR := xr copy.
	xL := xL bitXor: (piArray at: 1).
"	index <= 2
		ifTrue: [ 
			Transcript
				cr;
				show: 'New encipher';
				cr;
				show: 'Left: ';
				show: xL hex greaseString ]."
	(2 to: 17 by: 2)
		do: [ :each | 
			xR := self calculateBlfRndFor: xR with: xL andPiAt: each.
			xL := self calculateBlfRndFor: xL with: xR andPiAt: each + 1.
"			index = 2
				ifTrue: [ 
					Transcript
						cr;
						show: 'Right: ';
						show: xR hex greaseString;
						cr;
						show: 'Left: ';
						show: xL hex greaseString.
					index = 0 ] ]."].
	xR := xR bitXor: (piArray at: 18).
	xl := xR.
	xr := xL