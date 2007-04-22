as yet unclassified
computeSignatureForMessageHash: hash
	"Answer the digital signature of the given message hash using the given private key. A signature is a pair of large integers."

	| r s k tmp |
	r _ s _ 0.
	[r = 0 or: [s = 0]] whileTrue: [
		k _ self nextRandom160 \\ q.
		r _ (g raisedTo: k modulo: p) \\ q.
		tmp _ (hash asInteger + (x * r)) \\ q.
		s _ (k inverseModulo: q) * tmp \\ q].
	^ Array with: r with: s