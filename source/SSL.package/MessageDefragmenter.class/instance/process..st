protocol
process: plaintext

	| stream msg |
	plaintext is20Record 
		ifTrue: [^ self basicProcess: (SSL20ClientHelloMsg fromBytes: plaintext fragment)].

	(plaintext type = SSLHandshake type) 
		ifTrue: [^ self processHandshakeFragment: plaintext fragment].

	stream := plaintext fragment readStream.
	[msg := (SSLMessage messageAtType: plaintext type) fromStream: stream.
	self basicProcess: msg.
	stream atEnd]
		whileFalse.
