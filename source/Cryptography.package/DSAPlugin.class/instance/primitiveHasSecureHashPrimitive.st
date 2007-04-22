primitives-SHA
primitiveHasSecureHashPrimitive
	"Answer true if the secure hash primitive is implemented."

	self export: true.
	interpreterProxy pop: 1.
	interpreterProxy pushBool: true.
