suites
supportedSuites
	^((self diffieHellmanSuites union: self rsaSuites) intersection: (self aes256Suites union: self threeDesSuites)) intersection: self shaSuites