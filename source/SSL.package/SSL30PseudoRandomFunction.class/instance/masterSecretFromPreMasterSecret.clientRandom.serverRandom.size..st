as yet unclassified
masterSecretFromPreMasterSecret: masterSecret clientRandom: clientRandom serverRandom: serverRandom size: size

	| mixedSeed howMany resultStream code shaResult |
	howMany := size + 15 // 16.
	mixedSeed := masterSecret, clientRandom, serverRandom.
	resultStream := ReadWriteStream on: ByteArray new.
	1 to: howMany do: [:count |
		code := ByteArray new: count withAll: (Character value: 64 + count) asciiValue.
		shaResult := SHA1 hashMessage: code, mixedSeed.
		resultStream nextPutAll: (MD5 hashMessage: masterSecret, shaResult)].
	^ resultStream reset; next: size.
