stack
hasNextHeader

	self header isNil ifFalse: [^ true].
	self buffer size >= self headerSize
		ifTrue: [
			self header: (self buffer next: self headerSize) asInteger.
			^true].
	^false
