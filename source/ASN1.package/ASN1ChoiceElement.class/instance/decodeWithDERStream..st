decoding
decodeWithDERStream: derStream

	| tag |
	derStream atEnd ifTrue: [^ self error: 'missing element'].
	tag := derStream peekTag.
	(self matchesTag: tag)
		ifTrue: [^ type decodeWithDERStream: derStream]
		ifFalse: [^ self error: 'bad choice'].
