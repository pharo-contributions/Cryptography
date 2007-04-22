instance creation
messageAtType: type

	^ self subclasses
		detect: [:e | e type = type]
		ifNone: [nil]
