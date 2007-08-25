process
process: msg

	| shouldTransition |
	shouldTransition := self state process: msg.
	shouldTransition
		ifTrue: [self transitionToNextState].
