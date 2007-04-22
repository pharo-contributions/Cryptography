protocol
popFirst
	"Remove the head of the stack."
	| aProto |
	aProto := self removeFirst.
	self isEmpty ifFalse: [
		self isUpStack not
			ifTrue: [self tail link: nil]
			ifFalse: [aProto link: nil]].
	^ aProto