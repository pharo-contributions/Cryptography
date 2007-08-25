protocol
send: data 
	self socketStream isConnected
		ifTrue: [self socketStream nextPutAll: data]
		ifFalse: [self socketStream notNil
			ifTrue: [self socketStream closeAndDestroy]]