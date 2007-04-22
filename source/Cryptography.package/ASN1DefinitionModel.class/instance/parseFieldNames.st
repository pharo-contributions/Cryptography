services parsing
parseFieldNames
	| aString fields |
	aString := self asn1DefinitionString.
	fields := OrderedCollection new.
	(aString copyFrom: (aString indexOf: ${) + 1 to: (aString indexOf: $}) - 1) linesDo: [:aLine |
		(((aLine indexOfSubCollection: '--') > 0) or: [aLine withBlanksTrimmed isEmpty])ifFalse: [
			fields add: aLine subStrings first
		].
	].
	^fields