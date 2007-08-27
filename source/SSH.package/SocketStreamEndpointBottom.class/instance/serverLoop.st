process
serverLoop

	Processor yield.
	[self socketStream isDataAvailable
		ifTrue: [self receive: self socketStream]
		ifFalse: [[self socketStream receiveData] on: Error do: [:ex | ]].
	self socketStream isConnected]
		whileTrue.
	self kill.
