decoding
decodeValueWithDERStream: derStream length: length

	| aTag ele |
	aTag := derStream currentTag bitAnd: 2r00011111.
	ele := self elements
		detect: [:x | x matchesTag: aTag]
		ifNone: [self error: 'no choice'].
	^ ele decodeValueWithDERStream: derStream length: length.
