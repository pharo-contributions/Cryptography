visitor
handleSymmetricallyEncryptedDataPacket: anOpenPGPPacket
	| data |
	[anOpenPGPPacket verifyWithCipher: self cipher] whileFalse: [
		(self confirm: 'Possibly invalid passprase. Do you want to retry?') ifFalse: [^self].
		cipher := nil].
	data := (anOpenPGPPacket decryptWithCipher: self cipher).
	config handleStream: (ReadStream on: data) visitor: self