suites
rc4128Suites
	^(self allSuites associations select: [:a | (a value findString: 'RC4_128') > 0]) as: Dictionary