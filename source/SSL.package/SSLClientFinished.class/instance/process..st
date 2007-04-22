process
process: msg

	msg isHelloRequest ifFalse: [^ self sendAlertCode: 40].
	self processHelloRequestMsg: msg.
	^ true.
