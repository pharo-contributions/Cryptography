*cryptography-core
raisedTo: y modulo: n
	"Answer the modular exponential. Code by Jesse Welton."
	| s t u |
	s _ 1.
	t _ self.
	u _ y.
	[u = 0] whileFalse: [
		u odd ifTrue: [
			s _ s * t.
			s >= n ifTrue: [s _ s \\\ n]].
		t _ t * t.
		t >= n ifTrue: [t _ t \\\ n].
		u _ u bitShift: -1].
	^ s normalize
