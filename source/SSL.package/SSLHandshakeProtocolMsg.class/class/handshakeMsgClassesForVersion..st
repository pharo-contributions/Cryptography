accessing
handshakeMsgClassesForVersion: version

	| selectorDict selector |
	selectorDict := Dictionary new
		at: SSLProtocolVersion ssl30 put: #ssl30Classes;
		at: SSLProtocolVersion tls10 put: #tls10Classes;
		at: SSLProtocolVersion tls11 put: #tls11Classes;
		yourself.
	selector := selectorDict at: version ifAbsent: [^#()].
	^ self perform: selector