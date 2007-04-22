encoding
encode: anObject withDERStream: derStream

	| ele |
	ele := self elements
		detect: [:x | x isTypeFor: anObject]
		ifNone: [self error: 'no choice'].
	ele encode: anObject withDERStream: derStream.
