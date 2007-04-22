protocol
sendApplicationData: data

	| plaintext |
	plaintext := data asPlaintextRecord.
	plaintext version: self version.
	self send: plaintext.