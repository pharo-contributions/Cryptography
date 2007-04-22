protocol
sendChangeCipherSpec: msg

	| plaintext |
	plaintext := msg asPlaintextRecord.
	plaintext version: self version.
	self send: plaintext.
	self installWriteConnectionState.
