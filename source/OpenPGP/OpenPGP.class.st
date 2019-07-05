"
This class serves as a central interface to the OpenPGP implementation classes. Clients should not reference those classes directly, but they may use all non-private methods on the class side.
"
Class {
	#name : #OpenPGP,
	#superclass : #Object,
	#instVars : [
		'publicKeys',
		'privateKeys',
		'options'
	],
	#classVars : [
		'DefaultPrivateKeyFile',
		'DefaultPublicKeyFile'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #'class initialization' }
OpenPGP class >> initialize [
	"OpenPGP initialize"
	DefaultPrivateKeyFile := '/home/hmm/.gnupg/secring.gpg'.
	DefaultPublicKeyFile := '/home/hmm/.gnupg/pubring.gpg'
]

{ #category : #decryption }
OpenPGP >> decryptFile: aFilename [
	| str |
	str := FileStream readOnlyFileNamed: aFilename.
	[self handleStream: str visitor: OpenPGPDecryption new] ensure: [str close]
]

{ #category : #private }
OpenPGP >> handleStream: aStream visitor: aVisitor [
	| str packet |
	aVisitor config: self.
	str := OpenPGPStream onStream: aStream.
	[str atEnd] whileFalse: [
		packet := str nextPacket.
		packet acceptVisitor: aVisitor].
	aVisitor finish
]

{ #category : #private }
OpenPGP >> privateKeys [
	privateKeys == nil ifTrue: [privateKeys := self readKeyring: DefaultPrivateKeyFile].
	^privateKeys
]

{ #category : #private }
OpenPGP >> publicKeys [
	publicKeys == nil ifTrue: [publicKeys := self readKeyring: DefaultPublicKeyFile].
	^publicKeys
]

{ #category : #private }
OpenPGP >> readKeyring: aFilename [
	| in |
	in := OpenPGPStream onStream: (FileStream readOnlyFileNamed: aFilename).
	^[OpenPGPKeyring new readFrom: in] ensure: [in close]

]
