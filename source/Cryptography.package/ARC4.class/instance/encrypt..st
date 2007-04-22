accessing
encrypt: aByteArray
	| newBytes |
	newBytes := aByteArray copy.
	1 to: aByteArray size do: [ :each | newBytes at: each put: ((aByteArray at: each) bitXor: self next)].
	^ newBytes