accessing
nextSubpacketData
	| len |
	len := self nextNumber: 2.
	^stream next: len