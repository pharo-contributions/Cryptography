printing
saveOn: aStream
	| oldFormat lengthType dataSize |
	aStream nextPut: header.
	oldFormat := (header bitAnd: 64) = 0.
	oldFormat
		ifTrue: [
			lengthType := header bitAnd: 3.
			lengthType = 3
				ifTrue: [
					aStream nextPutAll: data]
				ifFalse: [
					aStream nextNumber: (1 bitShift: lengthType) put: data size.
					aStream nextPutAll: data]]
		ifFalse: [
			[self halt.
			dataSize := aStream nextNewFormatPacketLength.
			data := data isNil
					ifTrue: [aStream next: dataSize abs]
					ifFalse: [data, (aStream next: dataSize abs)].
			dataSize < 0] whileTrue: [].
			dataSize := data size].