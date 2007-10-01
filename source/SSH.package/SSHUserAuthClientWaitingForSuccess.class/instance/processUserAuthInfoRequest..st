process
processUserAuthInfoRequest: msg

	| newMsg |
	msg numPrompts = 0
		ifTrue: [
			newMsg := SSHUserAuthInfoResponseMessage new.
			newMsg numResponses: msg numPrompts.
			self machine sendMsg: newMsg].
	^ false.
