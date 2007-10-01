process
processSent: msg

	| shouldTransition |
	Transcript 
		cr; 
		nextPutAll: self securityCoord endpointString;
		nextPutAll: '>>';
		nextPutAll: 'processing sent... ';
		nextPutAll: msg asString;
		flush.
	shouldTransition := msg process: self state.
	self sendMessages.
	shouldTransition
		ifTrue: [self transitionToNextState].
