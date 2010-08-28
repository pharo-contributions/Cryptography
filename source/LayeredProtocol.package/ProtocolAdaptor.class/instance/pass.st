canned protocols
pass

	^self
		upBlock: [:arg | up upcall: arg];
		downBlock: [:arg | down downcall: arg]