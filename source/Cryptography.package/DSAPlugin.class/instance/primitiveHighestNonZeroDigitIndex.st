primitives-integers
primitiveHighestNonZeroDigitIndex
	"Called with one LargePositiveInteger argument. Answer the index of the top-most non-zero digit."

	| arg bigIntPtr i |
	self export: true.
	self var: #bigIntPtr declareC: 'unsigned char *bigIntPtr'.

	arg _ interpreterProxy stackObjectValue: 0.
	interpreterProxy success:
		(interpreterProxy fetchClassOf: arg) = interpreterProxy classLargePositiveInteger.
	interpreterProxy failed ifTrue: [^ nil].

	bigIntPtr _ interpreterProxy firstIndexableField: arg.
	i _ interpreterProxy stSizeOf: arg.
	[(i > 0) and: [(bigIntPtr at: (i _ i - 1)) = 0]]
		whileTrue: ["scan down from end to first non-zero digit"].

	interpreterProxy pop: 1.
	interpreterProxy pushInteger: i + 1.
