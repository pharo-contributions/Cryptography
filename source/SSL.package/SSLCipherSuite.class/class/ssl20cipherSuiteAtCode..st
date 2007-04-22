accessing
ssl20cipherSuiteAtCode: code

	^ self supportedSuites
		detect: [:e | (e codeAsByteArraySize: 3) = code]
		ifNone: [^ nil]
