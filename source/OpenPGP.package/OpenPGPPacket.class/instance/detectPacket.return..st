accessing
detectPacket: detectBlock return: valueBlock
	^self
		detectPacket: detectBlock
		return: valueBlock
		ifNone: []