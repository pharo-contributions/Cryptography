tests - defined types
testDefinedUnmappedSetType

	| bytes obj newBytes type |
	(ASN1Module name: #test) set: #TestSet.

	type := (ASN1Module name: #test) find: #TestSet.
	bytes := #(49 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: OrderedSet).
	self assert: (obj includes: true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).
