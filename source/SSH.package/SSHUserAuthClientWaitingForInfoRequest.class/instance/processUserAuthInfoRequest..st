process
processUserAuthInfoRequest: msg

	| newMsg inst |
	newMsg := SSHUserAuthInfoResponseMessage new.
	newMsg numResponses: msg numPrompts.
	inst := self addStateClass: SSHUserAuthClientWaitingForKeyboardInteractiveUserResponse.
	inst infoRequest: msg.
	inst infoResponse: newMsg.
	^ true.
