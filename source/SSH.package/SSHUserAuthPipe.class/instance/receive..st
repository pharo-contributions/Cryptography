protocol
receive: msg

	msg type >= 80
		ifTrue: [self isAuthenticated
			ifTrue: [self basicReceive: msg]
			ifFalse: [self error: 'bad msg number']]
		ifFalse: [self stateMachine processReceived: msg].
