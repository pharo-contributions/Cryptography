testing
testCase
	^(TLSClientHello new rawData: (self testArray copyFrom: 2 to: self testArray size)) parseVersion3Hello