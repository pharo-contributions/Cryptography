decrypt
decryptString: aString with: aKey
	|decryptedData |
	decryptedData := (self new ecbDecrypt: aString asByteArray with: aKey asByteArray  ).
        ^String fromByteArray:  decryptedData asByteArray .