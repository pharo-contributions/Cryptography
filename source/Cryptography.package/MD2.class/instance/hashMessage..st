accessing
hashMessage: aStringOrByteArray

	| input |
	input := self appendPaddingToInput: aStringOrByteArray asByteArray.
	input := self appendChecksumToInput: input.
	^ self processBlocks: input.
