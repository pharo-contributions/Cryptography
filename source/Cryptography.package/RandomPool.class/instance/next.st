as yet unclassified
next
	outputStream atEnd
		ifTrue: [self stir.
				outputStream := (pool copyFrom: 1 to: pool size // 2) readStream].
	^ outputStream next