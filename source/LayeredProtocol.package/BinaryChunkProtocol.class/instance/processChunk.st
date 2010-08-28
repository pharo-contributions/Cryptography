stack
processChunk
	"We may be able to use a virtual stream on the buffer segment for speed"

	self header isNil ifTrue: [^ false].
	up isNil ifTrue: [^ false].
	self buffer size >= self header
		ifTrue: [
			| chunk |
			chunk := self buffer next: self header.
			up upcallAll: chunk.
			self header: nil.
			^true].
	^false
