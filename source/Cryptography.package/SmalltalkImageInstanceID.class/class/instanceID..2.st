inquires
instanceID
	
	^InstanceID ifNil: [
		Transcript show: thisContext sender.
		thisContext sender receiver = self ifTrue: [
			InstanceID := UUID new.
		] ifFalse: [
			InstanceID := nil
		].
		InstanceID].