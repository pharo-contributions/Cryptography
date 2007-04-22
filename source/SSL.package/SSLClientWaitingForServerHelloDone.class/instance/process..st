process
process: msg

	msg isHelloRequest ifTrue: [^ false].
	msg isCertificateRequest ifTrue: [^self processCertificateRequestMsg: msg].
	msg isServerHelloDone ifFalse: [^ self sendAlertCode: 40].
	self processServerHelloDoneMsg: msg.
	^ true.
