protocol
sendClientHelloHandshake: handshake

	| plaintext |
	plaintext := handshake asPlaintextRecord.
	plaintext version: SSLProtocolVersion ssl30.
	self send: plaintext.