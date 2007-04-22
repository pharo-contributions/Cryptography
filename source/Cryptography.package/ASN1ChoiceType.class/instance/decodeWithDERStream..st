decoding
decodeWithDERStream: derStream

	| aTag ele |
	aTag := derStream peekTag.
	ele := self elements
		detect: [:x | x matchesTag: aTag]
		ifNone: [self error: 'no choice'].
	^ ele decodeWithDERStream: derStream.
