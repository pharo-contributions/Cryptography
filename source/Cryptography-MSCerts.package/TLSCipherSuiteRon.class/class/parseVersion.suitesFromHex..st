services
parseVersion: aHelloVersion suitesFromHex: hexString
	"return version 2 suites parsed into version 3 or simply chop up the version 3 suites and return them"
	| suiteSize resultCollection  |
	suiteSize := aHelloVersion = 2 ifTrue: [6] ifFalse: [4].
	resultCollection := hexString divideBySize: suiteSize.
	aHelloVersion = 2 ifTrue: [
		resultCollection := resultCollection collect: [:a | 
			(a copyFrom: 1 to: 2) = '00' ifTrue: [a copyFrom: 3 to: 6]
				ifFalse: [a].
		]
	].
	^resultCollection