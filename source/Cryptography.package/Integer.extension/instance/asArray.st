*cryptography-core
asArray

	| stream |
	stream := WriteStream on: Array new.
	self digitLength to: 1 by: -1 do: [:digitIndex |
		stream nextPut: (self digitAt: digitIndex)].
	^ stream contents
