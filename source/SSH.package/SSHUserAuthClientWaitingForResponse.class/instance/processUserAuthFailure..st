process
processUserAuthFailure: msg

	(msg authentications includes: 'password')
		ifTrue: [
			self sendPasswordUserAuthRequest.
			^ false].
	(msg authentications includes: 'keyboard-interactive')
		ifTrue: [
			self sendKeyboardInteractiveUserAuthRequest.
			self addStateClass: SSHUserAuthClientWaitingForInfoRequest.
			^ true].
	^ false