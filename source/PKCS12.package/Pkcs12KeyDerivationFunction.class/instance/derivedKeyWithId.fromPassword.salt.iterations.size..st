as yet unclassified
derivedKeyWithId: id fromPassword: passIn salt: saltIn iterations: iterate size: size

	| stream password |
	stream := WriteStream on: ByteArray new.
	passIn do: [:e | stream nextPut: 0; nextPut: e asciiValue].
	password := stream nextPut: 0; nextPut: 0; contents.

	^ self 
		derivedKeyWithId: id 
		fromDoubleBytePassword: password
		salt: saltIn 
		iterations: iterate 
		size: size