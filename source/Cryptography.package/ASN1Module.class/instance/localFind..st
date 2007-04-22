services
localFind: aSymbol

	^ self definitions
		at: aSymbol
		ifAbsent: [^ nil].
