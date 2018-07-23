services parsing
createObjectsAndPushFields
	self resultObject ifNil: 
		[self setRootObject].
	self currentObject ifNil: 
		[self setCurrentObject].
	self currentField isNil 
		ifTrue: [self setCurrentField]
		ifFalse: [self pushNextField].
	self setCurrentMutator.
	