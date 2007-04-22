as yet unclassified
decrypt: data

	| cipher decryptedStream fragmentLength subject decrypted |
	subject := data fragment.
	decrypted := rc4 decrypt: subject.

	fragmentLength := decrypted size - self hashSize.
	decryptedStream := decrypted readStream.
	cipher := SSLStreamCipher new
		content: (decryptedStream next: fragmentLength);
		mac: (decryptedStream next: self hashSize);
		yourself.

	^ SSLCompressedWithMAC new
		type: data type;
		version: data version;
		length: cipher content size;
		fragment: cipher content;
		mac: cipher mac;
		yourself
