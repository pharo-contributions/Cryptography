decrypt
decryptString: someData with: aKeyString
|dataToEncrypt |
dataToEncrypt :=OrderedCollection new.
someData do:[:each | dataToEncrypt add: each asciiValue ].
	^self new decrypt: dataToEncrypt asArray with: aKeyString asByteArray .