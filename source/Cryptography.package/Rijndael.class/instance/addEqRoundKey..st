block cipher
addEqRoundKey: roundNumber 
	| start |
	start := roundNumber * nB.
	1 to: nB do: [:k | 
		(state at: k) bitXor: (eqExpandedKey at: start + k)]