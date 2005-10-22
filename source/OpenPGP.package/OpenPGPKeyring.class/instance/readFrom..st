reading
readFrom: aStream
	| packet entry |
	entries := OrderedCollection new.
	[aStream atEnd] whileFalse: [
		packet := aStream nextPacket.
		packet isKeyPacket
			ifTrue: [packet owner: self. entries add: (entry := packet)]
			ifFalse: [(entry add: packet) ifFalse: [self halt]]].
	entries := entries asSortedCollection: [:a :b | a userIDString < b userIDString]