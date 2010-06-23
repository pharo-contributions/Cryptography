primitives-integers
primitiveBigMultiply
	"Multiple f1 by f2, placing the result into prod. f1, f2, and prod must be LargePositiveIntegers, and the length of prod must be the sum of the lengths of f1 and f2."
	"Assume: prod starts out filled with zeros"

	| prod f2 f1 prodLen f1Len f2Len prodPtr f2Ptr f1Ptr digit carry k sum |
	self export: true.
	self var: #prodPtr declareC: 'unsigned char *prodPtr'.
	self var: #f2Ptr declareC: 'unsigned char *f2Ptr'.
	self var: #f1Ptr declareC: 'unsigned char *f1Ptr'.

	prod _ interpreterProxy stackObjectValue: 0.
	f2 _ interpreterProxy stackObjectValue: 1.
	f1 _ interpreterProxy stackObjectValue: 2.
	interpreterProxy success: (interpreterProxy isBytes: prod).
	interpreterProxy success: (interpreterProxy isBytes: f2).
	interpreterProxy success: (interpreterProxy isBytes: f1).
	interpreterProxy success:
		(interpreterProxy fetchClassOf: prod) = interpreterProxy classLargePositiveInteger.
	interpreterProxy success:
		(interpreterProxy fetchClassOf: f2) = interpreterProxy classLargePositiveInteger.
	interpreterProxy success:
		(interpreterProxy fetchClassOf: f1) = interpreterProxy classLargePositiveInteger.
	interpreterProxy failed ifTrue:[^ nil].

	prodLen _ interpreterProxy stSizeOf: prod.
	f1Len _ interpreterProxy stSizeOf: f1.
	f2Len _ interpreterProxy stSizeOf: f2.
	interpreterProxy success: (prodLen = (f1Len + f2Len)).
	interpreterProxy failed ifTrue:[^ nil].

	prodPtr _ interpreterProxy firstIndexableField: prod.
	f2Ptr _ interpreterProxy firstIndexableField: f2.
	f1Ptr _ interpreterProxy firstIndexableField: f1.

	0 to: f1Len-1 do: [:i | 
		(digit _ f1Ptr at: i) ~= 0 ifTrue: [
			carry _ 0.
			k _ i.
			"Loop invariants: 0 <= carry <= 16rFF, k = i + j - 1"
			0 to: f2Len-1 do: [:j | 
				sum _ ((f2Ptr at: j) * digit) + (prodPtr at: k) + carry.
				carry _ sum bitShift: -8.
				prodPtr at: k put: (sum bitAnd: 255).
				k _ k + 1].
			prodPtr at: k put: carry]].

	interpreterProxy pop: 3.
