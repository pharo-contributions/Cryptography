as yet unclassified
processUserAuthRequest: msg

	msg methodName = 'none'
		ifTrue: [^ self processUserAuthNoneRequest: msg].
	msg methodName = 'publickey'
		ifTrue: [^ self processUserAuthPublicKeyRequest: msg].
	msg methodName = 'password'
		ifTrue: [^ self processUserAuthPasswordRequest: msg].
	msg methodName = 'hostbased'
		ifTrue: [^ self processUserAuthHostBasedRequest: msg].
	^ false