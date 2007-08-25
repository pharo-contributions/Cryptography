protocol
run

	self socketStream timeout: 30.
	self serverProcess notNil ifTrue: [^ self].
	serverProcess := [self serverLoop] forkAt: Processor userSchedulingPriority.