decrypt
decryptToString: someData with: aKey
|decryptedData | 
decryptedData := (self new ecbDecrypt: someData with: aKey asByteArray  ).
	^String fromByteArray:  decryptedData asByteArray .