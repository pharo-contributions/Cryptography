services parsing
parseASN1ClassName
	"return the ans1definition argument string"
	| aDefString classSepIndex |
	aDefString := self asn1DefinitionString ifNil: [^nil].
	classSepIndex := aDefString indexOfSubCollection: '::='.
	classSepIndex = 0 ifTrue: [^nil].
	^(aDefString copyFrom: 1 to: classSepIndex - 1) withBlanksTrimmed.