*cryptography-core
hex
	| stream |
	stream _ '' writeStream.
	self do: [ :each |
		stream
			nextPut: ('0123456789ABCDEF' at: each // 16 + 1);
			nextPut: ('0123456789ABCDEF' at: each \\ 16 + 1)].
	^ stream contents