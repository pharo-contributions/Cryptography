initialization
setCandidate: n
	n < 4 ifTrue: [self error: 'the candidate is too small'].
	candidate := n even ifTrue: [n + 1] ifFalse: [n].
	wheel := (PrimesWheel upTo: 2000) += candidate