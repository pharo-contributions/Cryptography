testing
matchesTag: anInteger

	^ (self typeMap
		detect: [:each | each matchesTag: anInteger]
		ifNone: [nil]) notNil
