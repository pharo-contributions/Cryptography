suites
rsaSuites
	^(self allSuites associations select: [:a | (a value findString: 'RSA') > 0 and: [(a value findString: 'DH') = 0 and: [(a value findString: 'DHE') = 0]]]) as: Dictionary