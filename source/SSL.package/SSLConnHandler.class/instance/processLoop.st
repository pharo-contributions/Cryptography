process
processLoop

	self waitForConnectionUntil: (Socket deadlineSecs: 10).
	[self conn isConnected]
		whileTrue: [
			self conn dataAvailable
				ifTrue: [self handleDataReceived: self conn receive]
				ifFalse: [(Delay forMilliseconds: 100) wait]].