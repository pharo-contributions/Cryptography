process
process: msg

	msg isHelloRequest ifTrue: [^ false].
	^ self sendAlertCode: 40

