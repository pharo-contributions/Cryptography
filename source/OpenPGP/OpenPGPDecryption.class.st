Class {
	#name : #OpenPGPDecryption,
	#superclass : #OpenPGPVisitor,
	#instVars : [
		'symmetricKeyPacket',
		'publicKeyPacket',
		'cipher'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #accessing }
OpenPGPDecryption >> cipher [
	| pw |
	cipher == nil ifFalse: [^cipher].
	symmetricKeyPacket == nil ifFalse: [
		pw := FillInTheBlank requestPassword: 'Passphrase for symmetric cipher?'.
		pw = '' ifFalse: [
			^cipher := symmetricKeyPacket cipherWithPassphrase: pw]].
	self halt	
]

{ #category : #visitor }
OpenPGPDecryption >> handleCompressedDataPacket: anOpenPGPPacket [
	| data |
	data := anOpenPGPPacket uncompressedData.
	config handleStream: (ReadStream on: data) visitor: self
]

{ #category : #visitor }
OpenPGPDecryption >> handleLiteralDataPacket: anOpenPGPPacket [
	| str |
	str := ReadStream on: anOpenPGPPacket data.
	self halt
]

{ #category : #visitor }
OpenPGPDecryption >> handleSymmetricKeyEncryptedSessionKeyPacket: anOpenPGPPacket [
	symmetricKeyPacket := anOpenPGPPacket
]

{ #category : #visitor }
OpenPGPDecryption >> handleSymmetricallyEncryptedDataPacket: anOpenPGPPacket [
	| data |
	[anOpenPGPPacket verifyWithCipher: self cipher] whileFalse: [
		(self confirm: 'Possibly invalid passprase. Do you want to retry?') ifFalse: [^self].
		cipher := nil].
	data := (anOpenPGPPacket decryptWithCipher: self cipher).
	config handleStream: (ReadStream on: data) visitor: self
]

{ #category : #missing }
OpenPGPDecryption >> verifyWithCipher: anObject [
	self error: #notYetImplemented
]
