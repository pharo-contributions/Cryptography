instance creation
newUpStackOn: duplexStack

	^ self new
		isUpStack: true;
		duplexStack: duplexStack;
		yourself