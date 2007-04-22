protocol
pop
	"Remove the head of the stack."
	| aProto |
	self isEmpty ifFalse: [aProto := self removeLast].
	self isEmpty ifFalse: [
		self isUpStack 
			ifTrue: [self head link: nil]
			ifFalse: [aProto link: nil]].
	^ aProto