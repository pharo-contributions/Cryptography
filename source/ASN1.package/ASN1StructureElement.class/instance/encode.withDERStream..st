encoding
encode: anObject withDERStream: derStream

	| val |
	val := self valueFrom: anObject.
	(val == nil and: [self isOptional])
		ifTrue: [^self].
	(self hasDefault and: [self default = val])
		ifTrue: [^self].
	self type 
		encode: val 
		withDERStream: derStream
		owner: anObject 
		ownerType: self owner.
