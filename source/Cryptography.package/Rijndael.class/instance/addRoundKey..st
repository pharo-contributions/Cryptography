block cipher
addRoundKey: roundNumber 
	| start |
	start _ roundNumber * nB.
	1 to: nB do: [:k | 
		(state at: k) bitXor: (expandedKey at: start + k)]