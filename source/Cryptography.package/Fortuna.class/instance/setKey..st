initialize
setKey: aByteArray
	aByteArray size < Rijndael keySize
		ifTrue:
			[ CryptographyError signal: 'Fortuna requires a ', Rijndael keySize printString, '-byte key' ].
	key := aByteArray copyFrom: 1 to: Rijndael keySize.
	self initializeCtr