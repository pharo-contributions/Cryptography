as yet unclassified
next: anInteger
	| answer |
	answer := ByteArray new: anInteger.
	1 to: anInteger do: [ :each | answer at: each put: self next].
	^ answer