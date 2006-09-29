suites
desSuites
	^(self allSuites associations select: [:a | (a value findString: 'DES') > 0 and: [(a value findString: '3DES') = 0]]) as: Dictionary