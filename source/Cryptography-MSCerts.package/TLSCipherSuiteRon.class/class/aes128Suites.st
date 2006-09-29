suites
aes128Suites
	^(self allSuites associations select: [:a | (a value findString: 'AES_128') > 0]) as: Dictionary