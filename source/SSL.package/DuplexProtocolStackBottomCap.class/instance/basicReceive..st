private
basicReceive: data

	self upProtocol notNil 
		ifTrue: [self upProtocol process: data].