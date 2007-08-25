protocol
send: data 
	self socketStream isConnected
		ifTrue: [self socketStream nextPutAllFlush: data]
		ifFalse: [self socketStream notNil
			ifTrue: [self socketStream closeAndDestroy]]