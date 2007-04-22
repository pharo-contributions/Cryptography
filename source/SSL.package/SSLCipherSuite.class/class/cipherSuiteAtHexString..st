accessing
cipherSuiteAtHexString: hexString

	^ self allSuites
		detect: [:e | e hexCodeString = hexString]
		ifNone: [^ nil]
