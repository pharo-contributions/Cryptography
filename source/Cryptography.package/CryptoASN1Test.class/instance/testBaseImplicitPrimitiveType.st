tests - defined types
testBaseImplicitPrimitiveType

	| bytes obj newBytes type |
	(ASN1Module name: #test) implicit: #TestImplicit type: #ASN1IntegerType tag: 0.

	type := (ASN1Module name: #test) find: #TestImplicit.
	bytes := #(128 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).
