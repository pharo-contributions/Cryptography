as yet unclassified
feistelWith: otherHalf
	| a b c d y byteArray |
	a := ((otherHalf bitShift: -24) bitAnd: 16rff) + 1.
	b := ((otherHalf bitShift: -16) bitAnd: 16rff) + 1.
	c := ((otherHalf bitShift: -8) bitAnd: 16rff) + 1.
	d := (otherHalf bitAnd: 16rff) + 1.
	y := ((s0 at: a) + (s1 at: b)) \\ 4294967296.	" (2 raisedTo: 32)"
	y := y bitXor: (s2 at: c).
	y := (y + (s3 at: d)) \\ 4294967296.	"(2 raisedTo: 32)"
	^ y