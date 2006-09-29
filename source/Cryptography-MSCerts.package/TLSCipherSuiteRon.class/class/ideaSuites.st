suites
ideaSuites
	^(self allSuites associations select: [:a | (a value findString: 'IDEA') > 0]) as: Dictionary