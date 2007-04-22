instance creation
fromBytes: helloBytes

	| helloStream |
	helloStream := ReadStream on: helloBytes.
	^ helloStream next = self type
		ifTrue: [SSL20ClientHelloMsg fromStream: helloStream].

