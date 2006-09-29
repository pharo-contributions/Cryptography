suites
aes256Suites
	^(self allSuites associations select: [:a | (a value findString: 'AES_256') > 0]) as: Dictionary