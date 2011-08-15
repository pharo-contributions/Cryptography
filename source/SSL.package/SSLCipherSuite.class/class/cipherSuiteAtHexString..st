accessing
cipherSuiteAtHexString: hexString

	^ self allSuites
		detect: [:e | e hexCodeString asLowercase = hexString asLowercase]
		ifNone: [^ nil]
