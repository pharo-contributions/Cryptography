block cipher
decryptState: aState 
	state := aState.
	self addEqRoundKey: nR.
	nR - 1 to: 1 by: -1 do: [:roundNumber | self eqRound: roundNumber].
	self eqFinalRound: 0.
	^ state