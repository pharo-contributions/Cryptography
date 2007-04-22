process
process: msg

	msg isClientHello ifFalse: [^ self sendAlertCode: 40].
	self processClientHelloMsg: msg.
	self sendMessages.
	self setupStates.
	^ true.
