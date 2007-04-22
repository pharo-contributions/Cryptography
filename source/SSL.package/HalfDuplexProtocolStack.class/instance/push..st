protocol
push: aProto
	"Push a new protocol onto the head of the stack."

	self isEmpty ifFalse: [
		self isUpStack 
			ifTrue: [self head link: aProto]
			ifFalse: [aProto link: self head]].
	aProto install.
	self addLast: aProto
