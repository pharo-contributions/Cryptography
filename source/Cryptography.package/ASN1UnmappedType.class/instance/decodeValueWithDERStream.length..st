decoding
decodeValueWithDERStream: derStream length: length

	| coll end obj |
	length = -1
		ifTrue: [^ self decodeValueIndefiniteLengthWithDERStream: derStream].
	coll := self containerClass new.
	end := derStream position + length.
	[derStream position < end ] whileTrue: [
		obj := derStream decode.
		coll add: obj].
	^coll