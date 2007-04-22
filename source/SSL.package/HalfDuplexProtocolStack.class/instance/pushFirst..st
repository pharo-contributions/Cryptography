protocol
pushFirst: aProto
	"Push a new protocol onto the head of the stack."

	self isEmpty ifFalse: [
		self isUpStack not
			ifTrue: [self tail link: aProto]
			ifFalse: [aProto link: self tail]].
	aProto install.
	self addFirst: aProto
