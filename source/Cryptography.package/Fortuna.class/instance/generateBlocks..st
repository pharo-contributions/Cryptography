private
generateBlocks: anInteger
	^ ByteArray streamContents:
		[ : stream |
		anInteger timesRepeat:
			[ stream nextPutAll: ctr nextBlock ] ]