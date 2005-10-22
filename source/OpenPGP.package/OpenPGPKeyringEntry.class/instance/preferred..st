accessing
preferred: aBoolean
	aBoolean
		ifTrue: [self class preferredKeys add: self keyID]
		ifFalse: [self class preferredKeys remove: self keyID ifAbsent: []]