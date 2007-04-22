instance creation
handshakeProtocolAtType: type

	^ self subclasses
		detect: [:e | e type = type]
		ifNone: [nil]
		