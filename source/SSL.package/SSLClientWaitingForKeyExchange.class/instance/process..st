process
process: msg

	msg isHelloRequest ifTrue: [^ false].
	msg isServerKeyExchange ifFalse: [^ self sendAlertCode: 40].
	self processServerKeyExchangeMsg: msg.
	^ true.
