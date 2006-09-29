suites
shaSuites
	^(self allSuites associations select: [:a | (a value findString: 'SHA') > 0]) as: Dictionary