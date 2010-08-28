canned protocols
trace

	self cannedString: 'trace'.
	^self
		upBlock: [:chunk |
			Transcript cr; nextPutAll: 'up ' , chunk asString; endEntry.
			self triggerEvent: #upcallAll.
			up ifNotNil: [:localUp | localUp upcallAll: chunk]];
		downBlock: [:chunk |
			Transcript cr; nextPutAll: 'down ' , chunk asString; endEntry.
			self triggerEvent: #downcallAll.
			down ifNotNil: [:localDown | localDown downcallAll: chunk]]