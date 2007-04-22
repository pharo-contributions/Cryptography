instance creation
bits: numberOfBits
	| shift b |
	shift _ numberOfBits - 1.
	b _ (SecureRandom picker nextBits: shift)+1.
	b _ b bitOr: 1. "ensure it is odd"
	b _ b bitOr: (1 << shift). "ensure it is of the requiered length"
	^ self candidate: b