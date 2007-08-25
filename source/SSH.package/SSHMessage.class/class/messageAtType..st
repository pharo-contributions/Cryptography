instance creation
messageAtType: type

	^ self allSubclasses
		detect: [:e | e type = type]
		ifNone: [nil]
