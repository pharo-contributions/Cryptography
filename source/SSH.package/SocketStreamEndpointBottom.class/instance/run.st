protocol
run

	self serverProcess notNil ifTrue: [^ self].
	serverProcess := [self serverLoop] forkAt: Processor userSchedulingPriority.