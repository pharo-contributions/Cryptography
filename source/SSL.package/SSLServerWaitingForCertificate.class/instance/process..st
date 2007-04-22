process
process: msg

	msg isHelloRequest ifTrue: [^ false].
	msg isCertificate ifFalse: [^ self sendAlertCode: 40].
	self processCertificateMsg: msg.
	^ true.
