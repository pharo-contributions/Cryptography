canned protocols
reflect

	^self
		upBlock: [:arg | down downcall: arg];
		downBlock: [:arg | up upcall: arg; flush]