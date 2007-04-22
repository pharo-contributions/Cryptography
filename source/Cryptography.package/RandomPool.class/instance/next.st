as yet unclassified
next
	outputStream atEnd
		ifTrue: [self stir.
				outputStream _ (pool copyFrom: 1 to: pool size // 2) readStream].
	^ outputStream next