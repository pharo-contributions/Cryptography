suites
blockSuites
	^(self allSuites associations select: [:a | (a value findString: 'CBC') > 0]) as: Dictionary