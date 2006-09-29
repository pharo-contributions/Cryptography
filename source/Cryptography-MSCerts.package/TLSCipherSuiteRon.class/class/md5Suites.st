suites
md5Suites
	^(self allSuites associations select: [:a | (a value findString: 'MD5') > 0]) as: Dictionary