process
process: msg

	msg isHelloRequest ifTrue: [^ false].
	msg isClientKeyExchange ifFalse: [^ self sendAlertCode: 40].
	self processClientKeyExchangeMsg: msg.
	^ true