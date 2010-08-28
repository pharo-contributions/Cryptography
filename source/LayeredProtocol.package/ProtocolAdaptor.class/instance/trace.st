canned protocols
trace

	^self
		upBlock: [:arg |
			Transcript cr; nextPutAll: 'up ' , arg printString; endEntry.
			up upcall: arg];
		downBlock: [:arg |
			Transcript cr; nextPutAll: 'down ' , arg printString; endEntry.
			down downcall: arg]