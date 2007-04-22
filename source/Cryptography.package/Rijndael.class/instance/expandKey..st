key schedule
expandKey: aByteArray
	| w total want sw key |
	key _ self stateFromBytes: aByteArray columns: nK.
	total _ nB * (nR + 1).
	w _ Array new: total.

	1 to: nK do: [:n | 
		w at: n put: (key at: n)].
	nK + 1 	to: total do: [:n | 
		want _ (w at: n - 1) copy.
		(n - 1 \\ nK) = 0 ifTrue: 
			[sw _ ByteArray new: 4.
			sw at: 1 put: 
				((SubByte at: (want byteAt: 2) + 1) bitXor: (RoundConstant at: n-1 / nK)).
			2 to: 4 do: [:i |
				sw at: i put: (SubByte at: (want byteAt: i \\ 4 + 1) + 1)].
			sw _ ThirtyTwoBitRegister loadFrom: sw at: 1]
		ifFalse: 
			[(n - 1 \\ nK = 4) & (nK > 6) ifTrue: 
				[sw _ ByteArray new: 4.
				1 to: 4 do: [:i | sw at: i put: (SubByte at: (want byteAt: i) + 1)].
				sw _ ThirtyTwoBitRegister loadFrom: sw at: 1]
			ifFalse:
				[sw _ want]
			].
		w at: n put: ((w at: n - nK) copy bitXor: sw).
		].
	expandedKey _ w