initialize-release
initializeOnConnection: conn

	connection := conn.
	pendingStates := OrderedCollection new.
	messageSenders := OrderedCollection new.
	self addStateClass: SSHInitialState.
	self transitionToNextState.
