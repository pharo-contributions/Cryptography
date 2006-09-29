suites
threeDesSuites
	^(self allSuites associations select: [:a | (a value findString: '3DES') > 0]) as: Dictionary