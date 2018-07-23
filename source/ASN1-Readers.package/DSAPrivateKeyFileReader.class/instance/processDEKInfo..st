initialization
processDEKInfo: data

	| stream algorithm |
	stream := data readStream.
	stream upTo: $:.
	algorithm := (stream upTo: $,) withBlanksTrimmed.
	self iv: (Integer readFrom: stream base: 16) asByteArray.
