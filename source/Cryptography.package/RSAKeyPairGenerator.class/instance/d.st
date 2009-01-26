private
d
	d isNil ifFalse: [^ d].
	^ d _ self e inverseModulo: self p - 1 * (self q - 1)