accessing
addImport: aModule

	(self imports includes: aModule)
		ifFalse: [self imports add: aModule].
