protocol
sendHandshake: handshake

	| plaintext |
	plaintext := handshake asPlaintextRecord.
	plaintext version: self version.
	self send: plaintext.