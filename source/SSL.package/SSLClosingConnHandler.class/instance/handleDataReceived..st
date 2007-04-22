connection
handleDataReceived: data

	Transcript cr; show: '>>> ', data asString.
	self conn ifNotNil: [self conn close].
