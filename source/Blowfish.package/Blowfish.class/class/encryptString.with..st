encrypt
encryptString: someData with: aKeyString
"use this with a string"
|dataToEncrypt |
dataToEncrypt :=OrderedCollection new.
someData do:[:each | dataToEncrypt add: each asciiValue ].
	^self new ecbEncrypt: dataToEncrypt asArray with: aKeyString asByteArray .