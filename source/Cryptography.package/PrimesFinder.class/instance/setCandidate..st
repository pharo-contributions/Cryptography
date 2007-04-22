initialization
setCandidate: n
	n < 4 ifTrue: [self error: 'the candidate is too small'].
	candidate _ n even ifTrue: [n + 1] ifFalse: [n].
	wheel _ (PrimesWheel upTo: 2000) += candidate