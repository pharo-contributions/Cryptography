canned protocols
reflectDown

	self cannedString: 'reflectDown'.
	^self
		upBlock: [:chunk | down downcallAll: chunk];
		downBlock: [:chunk | down downcallAll: chunk]
