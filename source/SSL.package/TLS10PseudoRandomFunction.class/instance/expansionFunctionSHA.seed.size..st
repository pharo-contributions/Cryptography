recursive
expansionFunctionSHA: secret seed: seed size: size

	| howMany resultStream valueToBeHashed |
	howMany := size + 19 // 20.
	resultStream := ReadWriteStream on: ByteArray new.
	1 to: howMany do: [:count |
		valueToBeHashed := seed.
		count timesRepeat: [
			valueToBeHashed := 	SHA1 new hmac key: secret; digestMessage: valueToBeHashed].
		resultStream nextPutAll: (SHA1 new hmac key: secret; digestMessage: (valueToBeHashed, seed))].
	^ resultStream reset; next: size.


