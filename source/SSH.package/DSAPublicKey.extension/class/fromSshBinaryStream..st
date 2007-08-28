*ssh
fromSshBinaryStream: stream

	| p q g y |
	p := (stream next: (stream next: 4) asByteArray asInteger) asByteArray asInteger normalize.
	q := (stream next: (stream next: 4) asByteArray asInteger) asByteArray asInteger normalize.
	g := (stream next: (stream next: 4) asByteArray asInteger) asByteArray asInteger normalize.
	y := (stream next: (stream next: 4) asByteArray asInteger) asByteArray asInteger normalize.
	^ DSAPublicKey p: p q: q g: g y: y.
