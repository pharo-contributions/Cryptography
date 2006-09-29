suites
streamSuites
	^(self allSuites associations select: [:a | (a value findString: 'CBC') = 0 and: [(a value findString: 'NULL') = 0]]) as: Dictionary