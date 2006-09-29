suites
diffieHellmanSuites
	^(self allSuites associations select: [:a | (a value findString: 'DH') > 0 or: [(a value findString: 'DHE') > 0]]) as: Dictionary