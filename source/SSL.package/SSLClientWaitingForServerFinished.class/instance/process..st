as yet unclassified
process: msg

	msg isHelloRequest ifTrue: [^ false].
	msg isFinished ifFalse: [^ self sendAlertCode: 40].
	self processServerFinishedMsg: msg.
	^ true.
