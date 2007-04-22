*cryptography-core
asByteArray

	| stream |
	stream := WriteStream on: ByteArray new.
	self digitLength to: 1 by: -1 do: [:digitIndex |
		stream nextPut: (self digitAt: digitIndex)].
	^ stream contents
