canned protocols
pass

	self cannedString: 'pass'.
	^self
		upBlock: [:chunk | up upcallAll: chunk];
		downBlock: [:chunk | down downcallAll: chunk]