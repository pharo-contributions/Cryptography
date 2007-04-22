process
process: msg

	msg isHelloRequest ifTrue: [^ false].
	msg isCertificateVerify ifFalse: [^ self sendAlertCode: 40].
	self processCertificateVerifyMsg: msg.
	^ true.
