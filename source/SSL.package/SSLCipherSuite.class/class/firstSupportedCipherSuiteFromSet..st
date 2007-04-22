accessing
firstSupportedCipherSuiteFromSet: set

	^ set
		detect: [:e | self supportedSuites includes: e]
		ifNone: [^ nil]

