private
basicSend: data

	self downProtocol notNil 
		ifTrue: [self downProtocol process: data].