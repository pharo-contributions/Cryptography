accessing
keysWithUserIDMatching: aString
	^entries select: [:each | (each packets
							detect: [:pack | pack isUserIDPacket and: [aString match: pack data asString]]
							ifNone: []) notNil]