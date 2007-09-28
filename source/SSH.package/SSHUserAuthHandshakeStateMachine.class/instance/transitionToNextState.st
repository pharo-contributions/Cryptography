process
transitionToNextState

	self pendingStates isEmpty ifTrue: [self error: 'no pending state'].
	self state release.
	state := self pendingStates removeFirst.
	self state sendInitialMessages.
