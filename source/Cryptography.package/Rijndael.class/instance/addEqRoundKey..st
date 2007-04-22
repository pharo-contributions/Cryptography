block cipher
addEqRoundKey: roundNumber 
	| start |
	start _ roundNumber * nB.
	1 to: nB do: [:k | 
		(state at: k) bitXor: (eqExpandedKey at: start + k)]