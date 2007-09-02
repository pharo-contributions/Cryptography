protocol
run

	self socketStream timeout: 2.
	self serverProcess notNil ifTrue: [^ self].
	serverProcess := [self serverLoop] forkAt: Processor userSchedulingPriority.