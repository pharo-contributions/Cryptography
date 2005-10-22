accessing
cipher
	| pw |
	cipher == nil ifFalse: [^cipher].
	symmetricKeyPacket == nil ifFalse: [
		pw := FillInTheBlank requestPassword: 'Passphrase for symmetric cipher?'.
		pw = '' ifFalse: [
			^cipher := symmetricKeyPacket cipherWithPassphrase: pw]].
	self halt	