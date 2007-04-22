process
sendHandshake: handshake

	| handshakeMsg |
	handshakeMsg := handshake asHandshake.
	self securityParams addMessageProcessed: handshakeMsg.
	self connection sendHandshake: handshakeMsg.
