accessing
detectPacket: detectBlock return: valueBlock ifNone: noneBlock
	packets do: [:each |
		(detectBlock value: each) ifTrue: [^valueBlock value: each]].
	^noneBlock value