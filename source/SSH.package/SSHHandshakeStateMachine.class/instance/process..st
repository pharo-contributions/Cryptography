process
process: msg

	| shouldTransition |
	Transcript 
		cr; 
		nextPutAll: self securityCoord endpointString;
		nextPutAll: '>>';
		nextPutAll: 'processing... ';
		nextPutAll: msg asString;
		flush.
	shouldTransition := msg process: self state.
	shouldTransition
		ifTrue: [self transitionToNextState].
