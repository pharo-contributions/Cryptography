stack
downcallAll: chunk

	| downHeader |
	downHeader := self headerForChunk: chunk.
	down downcallAll: downHeader.
	down downcallAll: chunk.
