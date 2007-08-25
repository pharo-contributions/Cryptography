process
serverLoop

	[Processor yield.
		[self socketStream isDataAvailable
			ifTrue: [self receive: self socketStream]
			ifFalse: [self socketStream receiveData].
		 self socketStream isConnected]
			whileTrue]
				on: Error
				do: [:ex | self halt. self duplexStack notNil ifTrue: [self duplexStack processError: ex]].
	self kill.
