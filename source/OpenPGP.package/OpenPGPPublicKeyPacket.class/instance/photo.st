accessing
photo
	photo notNil ifTrue: [^photo].
	^self
		detectPacket: [:p | p isPhotoIDPacket]
		return: [:p | photo := p image]