primitives-integers
primitiveBigDivide
	"Called with three LargePositiveInteger arguments, rem, div, quo. Divide div into rem and store the quotient into quo, leaving the remainder in rem."
	"Assume: quo starts out filled with zeros."

	| rem div quo |
	self export: true.
	quo _ interpreterProxy stackObjectValue: 0.
	div _ interpreterProxy stackObjectValue: 1.
	rem _ interpreterProxy stackObjectValue: 2.

	interpreterProxy success:
		(interpreterProxy fetchClassOf: rem) = interpreterProxy classLargePositiveInteger.
	interpreterProxy success:
		(interpreterProxy fetchClassOf: div) = interpreterProxy classLargePositiveInteger.
	interpreterProxy success:
		(interpreterProxy fetchClassOf: quo) = interpreterProxy classLargePositiveInteger.
	interpreterProxy failed ifTrue:[^ nil].

	dsaRemainder _ interpreterProxy firstIndexableField: rem.
	dsaDivisor _ interpreterProxy firstIndexableField: div.
	dsaQuotient _ interpreterProxy firstIndexableField: quo.

	divisorDigitCount _ interpreterProxy stSizeOf: div.
	remainderDigitCount _ interpreterProxy stSizeOf: rem.

	"adjust pointers for base-1 indexing"
	dsaRemainder _ dsaRemainder - 1.
	dsaDivisor _ dsaDivisor - 1.
	dsaQuotient _ dsaQuotient - 1.

	self bigDivideLoop.
	interpreterProxy pop: 3.
