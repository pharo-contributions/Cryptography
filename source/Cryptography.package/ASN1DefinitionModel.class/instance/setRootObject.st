services parsing
setRootObject
	self resultObject: self parseRootObjectType new.
	self resultObject isCollection
		ifTrue: [self currentObject: self subject new]
		ifFalse: [self currentObject: self resultObject]