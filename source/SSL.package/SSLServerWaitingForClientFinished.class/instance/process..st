process
process: msg

	msg isHelloRequest ifTrue: [^ false].
	msg isFinished ifFalse: [^ self sendAlertCode: 40].
	self processClientFinishedMsg: msg.
	^ true.
