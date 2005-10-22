instance creation
readFrom: aStream
	| oldFormat lengthType header tag data dataSize |
	header := aStream next.
	header < 128 ifTrue: [self errorInvalidHeader].
	oldFormat := (header bitAnd: 64) = 0.
	oldFormat
		ifTrue: [
			tag := (header bitShift: -2) bitAnd: 15.
			lengthType := header bitAnd: 3.
			lengthType = 3
				ifTrue: [
					data := aStream upToEnd]
				ifFalse: [
					dataSize := aStream nextNumber: (1 bitShift: lengthType).
					data := aStream next: dataSize]]
		ifFalse: [
			tag := header bitAnd: 63.
			[dataSize := aStream nextNewFormatPacketLength.
			data := data isNil
					ifTrue: [aStream next: dataSize abs]
					ifFalse: [data, (aStream next: dataSize abs)].
			dataSize < 0] whileTrue: [].
			dataSize := data size].
	^(self packetClassForTag: tag) new header: header data: data