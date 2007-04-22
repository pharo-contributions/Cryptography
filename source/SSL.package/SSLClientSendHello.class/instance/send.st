process
send

	| hello |
	hello := SSLClientHelloMsg new.
	hello clientVersion: self connection version.
	hello random: self securityParams clientRandom.
	self suite notNil
		ifTrue: [hello cipherSuites: (OrderedCollection with: self suite)]
		ifFalse: [hello cipherSuites: SSLCipherSuite supportedSuites copy].
	self sendClientHelloHandshake: hello.
