accessing
cipherSuiteAtCode: code

	^ self allSuites
		detect: [:e | e codeAsByteArray = code]
		ifNone: [^ nil]
