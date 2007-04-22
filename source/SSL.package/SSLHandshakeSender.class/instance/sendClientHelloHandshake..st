process
sendClientHelloHandshake: handshake

	| handshakeMsg |
	handshakeMsg := handshake asHandshake.
	self securityParams addMessageProcessed: handshakeMsg.
	self connection sendClientHelloHandshake: handshakeMsg.
