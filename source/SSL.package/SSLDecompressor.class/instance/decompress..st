process
decompress: data

	data is20Record ifTrue: [^data].
	^ self compressionState decompress: data