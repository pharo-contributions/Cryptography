recursive
expansionFunctionMD5: secret seed: seed size: size

	| howMany resultStream valueToBeHashed |
	howMany := size + 15 // 16.
	resultStream := ReadWriteStream on: ByteArray new.
	1 to: howMany do: [:count |
		valueToBeHashed := seed.
		count timesRepeat: [
			valueToBeHashed := 	MD5 new hmac key: secret; digestMessage: valueToBeHashed].
		resultStream nextPutAll: (MD5 new hmac key: secret; digestMessage: (valueToBeHashed, seed) asByteArray)].
	^ resultStream reset; next: size.
