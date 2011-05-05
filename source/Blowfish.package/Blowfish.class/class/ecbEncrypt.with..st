encrypt
ecbEncrypt: someData with: aKey
"use this when you have a byteArray"
	^self new ecbEncrypt: someData with: aKey.