process
messagesProcessedAsByteArray

	^ (self messagesProcessed
		inject: (ByteArray new: 2048) writeStream
		into: [:stream :msg | stream nextPutAll: msg asByteArray. stream])
			contents.