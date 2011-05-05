encrypt
ecbDecrypt: someData with: aKey
"use this when you have a byteArray"
	^self new ecbDecrypt: someData with: aKey.