as yet unclassified
process: msg

	msg isHelloRequest ifTrue: [^ false].
	msg isServerHello ifFalse: [^ self sendAlertCode: 40].
	self processServerHelloMsg: msg.
	self setupStates.
	^ true.
