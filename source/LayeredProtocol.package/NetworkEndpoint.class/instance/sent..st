debugging
sent: char

	| str |
	str := char asInteger printStringBase: 16.
	str := str copyFrom: 4 to: str size.
	Transcript cr; nextPut: $>; tab; nextPutAll: (str padded: #left to: 2 with: $0); tab; nextPut: char asCharacter