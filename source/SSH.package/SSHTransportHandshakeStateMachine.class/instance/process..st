process
process: msg

	| shouldTransition |
	shouldTransition := msg process: self state.
	self sendMessages.
	shouldTransition
		ifTrue: [self transitionToNextState].
