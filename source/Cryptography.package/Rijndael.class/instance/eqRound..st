block cipher
eqRound: roundNumber
	| a0 a1 a2 a3 result newState start |
	newState _ Array new: nB.

	"do SubBytesInverse, ShiftRowsInverse and MixColumnsInverse in one step"
	0 to: nB-1 do: [:j |
		a0 _ (state at: j + 1) byteAt: 1.
		a1 _ (state at: (j - shiftOffset1) \\ nB + 1) byteAt: 2.
		a2 _ (state at: (j - shiftOffset2) \\ nB + 1) byteAt: 3.
		a3 _ (state at: (j - shiftOffset3) \\ nB + 1) byteAt: 4.
		result _ (InvT0 at: a0+1) copy.
		result bitXor: (InvT1 at: a1+1).
		result bitXor: (InvT2 at: a2+1).
		result bitXor: (InvT3 at: a3+1).
		newState at: j+1 put: result].

	"add equivalent round key"
	start _ roundNumber * nB.
	1 to: nB do: [:k |
		state at: k put: ((newState at: k) bitXor: (eqExpandedKey at: start + k))]