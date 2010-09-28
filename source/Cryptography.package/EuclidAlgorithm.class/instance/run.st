as yet unclassified
run
	((a isKindOf: LargePositiveInteger)
		and: [b isKindOf: LargePositiveInteger])
		ifTrue: [self lehmer]
		ifFalse: [self doBasicAlgorithm]