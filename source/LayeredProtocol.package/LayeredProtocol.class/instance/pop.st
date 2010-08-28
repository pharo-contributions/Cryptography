protocol
pop
	"Remove the head of the stack."
	| aProto |
	self isEmpty ifTrue: [^ nil].
	aProto := self removeFirst.
	self isEmpty
		ifFalse: [aProto down: nil.
			self head up: nil].
	aProto session: nil.
	^ aProto