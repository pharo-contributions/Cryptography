instance creation
newDownStackOn: duplexStack

	^ self new
		isUpStack: false;
		duplexStack: duplexStack;
		yourself