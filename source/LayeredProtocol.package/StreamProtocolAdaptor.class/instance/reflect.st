canned protocols
reflect

	self cannedString: 'reflect'.
	^self
		upBlock: [:chunk | down downcallAll: chunk];
		downBlock: [:chunk | up upcallAll: chunk; flush]
