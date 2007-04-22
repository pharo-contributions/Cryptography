*cryptography-core
hexStringInNibbles


	^ (self  
		inject: String new writeStream
		into: [:stream :byte |
			stream
				nextPut: ('0123456789ABCDEF' at: byte // 16 + 1);
				nextPut: ('0123456789ABCDEF' at: byte \\ 16 + 1);
				nextPut: Character space.  
			stream]) contents.
