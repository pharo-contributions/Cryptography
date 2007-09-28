protocol
receive: msg

	msg type >= 80
		ifTrue: [msg process: self]
		ifFalse: [self error: 'bad msg number'].
