process
decrypt: data

	data is20Record ifTrue: [^data].
	^ self cipherState decrypt: data.
