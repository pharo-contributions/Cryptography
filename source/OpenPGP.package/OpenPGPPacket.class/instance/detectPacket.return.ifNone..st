accessing
detectPacket: detectBlock return: valueBlock ifNone: noneBlock
	ownedPackets isNil ifFalse: [
		self ownedPackets do: [:each |
			(detectBlock value: each) ifTrue: [^valueBlock value: each].
			each detectPacket: detectBlock return: valueBlock ifNone: []]].
	^noneBlock value