as yet unclassified
processUserAuthNoneRequest: msg

	| failureMsg |
	failureMsg := SSHUserAuthFailureMessage new.
	failureMsg authentications add: 'password'.
	failureMsg partialSuccess: false.
	self machine sendMsg: failureMsg.
	^ false