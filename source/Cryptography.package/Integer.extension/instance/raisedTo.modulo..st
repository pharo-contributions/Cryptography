*cryptography-core
raisedTo: y modulo: n
	"Answer the modular exponential. Code by Jesse Welton."
	| s t u |
	s := 1.
	t := self.
	u := y.
	[u = 0] whileFalse: [
		u odd ifTrue: [
			s := s * t.
			s >= n ifTrue: [s := s \\\ n]].
		t := t * t.
		t >= n ifTrue: [t := t \\\ n].
		u := u bitShift: -1].
	^ s normalize
