conn states
packagerDictionary

	^ Dictionary new
		at: #initial put: SSHInitialMsgPackagerSecurityState;
		at: #binary put: SSHMsgPackagerSecurityState;
		yourself.
