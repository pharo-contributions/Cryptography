protocol
push: aProto
	"Push a new protocol onto the head of the stack."

	aProto session: self.
	self isEmpty ifFalse: [aProto down: self head.  self head up: aProto].
	aProto install.
	self addFirst: aProto