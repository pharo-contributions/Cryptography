accessing
at: key

	^self typeMap at: key ifAbsent: [self defaultType]