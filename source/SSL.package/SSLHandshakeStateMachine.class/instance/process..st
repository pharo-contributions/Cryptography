process
process: msg

	| protocolMsg shouldTransition |
	msg is20ClientHello ifTrue: [
		shouldTransition := self state process: msg.
		shouldTransition
			ifTrue: [self transitionToNextState].
		^ self].
	protocolMsg := self protocolMsgForHandshake: msg.
	shouldTransition := self state process: protocolMsg.
	self securityParams addMessageProcessed: msg.
	shouldTransition
		ifTrue: [self transitionToNextState].
