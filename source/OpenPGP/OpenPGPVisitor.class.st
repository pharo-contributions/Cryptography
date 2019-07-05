Class {
	#name : #OpenPGPVisitor,
	#superclass : #Object,
	#instVars : [
		'config'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #'as yet unclassified' }
OpenPGPVisitor class >> new [
	^super new initialize
]

{ #category : #visitor }
OpenPGPVisitor >> config: anOpenPGP [
	config := anOpenPGP
]

{ #category : #visitor }
OpenPGPVisitor >> finish [
	"perform any necessary cleanup"
]

{ #category : #visitor }
OpenPGPVisitor >> handleCompressedDataPacket: anOpenPGPCompressedDataPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleLiteralDataPacket: anOpenPGPLiteralDataPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleMarkerPacket: anOpenPGPMarkerPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleOnePassSignaturePacket: anOpenPGPOnePassSignaturePacket [
	"do nothing"
]

{ #category : #'not yet implemented' }
OpenPGPVisitor >> handleOpenPassSignaturePacket: anObject [
	self error: #notYetImplemented
]

{ #category : #visitor }
OpenPGPVisitor >> handlePacket: anOpenPGPPacket [
	self error: 'unknown packet type encountered'
]

{ #category : #visitor }
OpenPGPVisitor >> handlePhotoIDPacket: anOpenPGPPhotoIDPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handlePublicKeyEncryptedSessionKeyPacket: anOpenPGPPublicKeyEncryptedSessionKeyPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handlePublicKeyPacket: anOpenPGPPublicKeyPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handlePublicSubkeyPacket: anOpenPGPPublicSubkeyPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleSecretKeyPacket: anOpenPGPSecretKeyPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleSecretSubkeyPacket: anOpenPGPSecretSubkeyPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleSignaturePacket: anOpenPGPSignaturePacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleSymmetricKeyEncryptedSessionKeyPacket: anOpenPGPSymmetricKeyEncryptedSessionKeyPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleSymmetricallyEncryptedDataPacket: anOpenPGPSymmetricallyEncryptedDataPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleTrustPacket: anOpenPGPTrustPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> handleUserIDPacket: anOpenPGPUserIDPacket [
	"do nothing"
]

{ #category : #visitor }
OpenPGPVisitor >> initialize [
	"perform any necessary initialization"
]
