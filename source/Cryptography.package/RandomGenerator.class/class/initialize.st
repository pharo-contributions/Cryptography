initialize-release
initialize
	super initialize.
	Smalltalk
		addToStartUpList: self ;
		addToShutDownList: self.
	self startUp