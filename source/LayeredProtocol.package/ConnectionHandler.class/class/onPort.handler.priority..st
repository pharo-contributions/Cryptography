instance creation
onPort: aNumber handler: aBlock priority: pNum
	^self new
		initializeOnPort: aNumber
		handler: aBlock
		priority: pNum