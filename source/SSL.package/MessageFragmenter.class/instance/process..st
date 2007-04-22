protocol
process: data

	| dataStream dupRecord dataChunk |
	(data length < data sizeLimit)
		ifTrue: [^ self basicProcess: data].
	dataStream := data fragment readStream.
	[dataStream atEnd]
		whileFalse: [
			dupRecord := data copy.
			dataChunk := dataStream next: data sizeLimit.
			dupRecord length: dataChunk size.
			dupRecord fragment: dataChunk.
			self basicProcess: dupRecord].