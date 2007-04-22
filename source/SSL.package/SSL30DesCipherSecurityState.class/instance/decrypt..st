process
decrypt: data

	| cipher encryptedStream block decryptedStream decrypted paddingLength fragmentLength |
	encryptedStream := data fragment readStream.
	decryptedStream := ReadWriteStream on: (ByteArray new: encryptedStream size).
	[encryptedStream atEnd] whileFalse: 
		[block := encryptedStream next: 8.
		des decryptBlock: block.
		decryptedStream nextPutAll: block].
	decrypted := decryptedStream contents.

	paddingLength := decrypted last.
	fragmentLength := decrypted size - self hashSize - paddingLength - 1.
	decryptedStream := decrypted readStream.
	cipher := SSLBlockCipher new
		content: (decryptedStream next: fragmentLength);
		mac: (decryptedStream next: self hashSize);
		padding: (decryptedStream next: paddingLength);
		paddingLength: paddingLength;
		yourself.

	^ SSLCompressedWithMAC new
		type: data type;
		version: data version;
		length: cipher content size;
		fragment: cipher content;
		mac: cipher mac;
		yourself
