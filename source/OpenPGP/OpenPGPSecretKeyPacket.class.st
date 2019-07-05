"
Data stored in a secret key OpenPGP packet.

Instance Variables:
publicKeyData			<OpenPGPPublicKeyData> public key data for this private key
stringToKeyUsage		<Integer> specifies how the passphrase protecting the secret key is used
stringToKeySpecifier		<OpenPGPS2KSpecifier> further specifying string to key conversion
encryptionAlgorithm	<Integer> specifying the encryption algorithm used to protect the key
initialVector				<ByteArray|nil> initial data for the encryption
mpis					<ByteArray|Array of: LargePositiveInteger> algorithm-specific secret key data
checksum				<Integer> checksum to verify that the user gave the correct passphrase

"
Class {
	#name : #OpenPGPSecretKeyPacket,
	#superclass : #OpenPGPPublicKeyPacket,
	#instVars : [
		'stringToKeyUsage',
		'stringToKeySpecifier',
		'encryptionAlgorithm',
		'initialVector',
		'mpis',
		'checksum'
	],
	#category : 'OpenPGP-Packets'
}

{ #category : #visitor }
OpenPGPSecretKeyPacket >> acceptVisitor: aVisitor [
	^aVisitor handleSecretKeyPacket: self
]

{ #category : #private }
OpenPGPSecretKeyPacket >> decryptMPIsUsing: passphrase [
	"Decrypt the secret key data to use in signing and decryption of encrypted messages.
	Returns an Array of LargePositiveIntegers"
	| k cast5 cfb bytes sum str |
	encryptionAlgorithm = 3 ifFalse: [self error: 'Only CAST5 supported at the moment'].
	k := stringToKeySpecifier stringToKey: passphrase numBytes: 16.
	cast5 := CAST5 new setKey: k.
	cfb := CFBEncryption new cipher: cast5 initialVector: initialVector.
	bytes := cfb decryptBytes: mpis.
	sum := (bytes unsignedShortAt: bytes size -1 bigEndian: true).
	bytes := bytes copyFrom: 1 to: bytes size-2.
	bytes sum = sum ifFalse: [^nil].
	str := OpenPGPStream on: (ReadStream on: bytes).
	^str mpisUpToEnd
]

{ #category : #accessing }
OpenPGPSecretKeyPacket >> decryptedSecretKeys [
	^self decryptMPIsUsing: (FillInTheBlank requestPassword: 'Enter your passphrase')
]

{ #category : #testing }
OpenPGPSecretKeyPacket >> isPrivateKeyPacket [
	^true
]

{ #category : #reading }
OpenPGPSecretKeyPacket >> parseData: aStream [
	super parseData: aStream.
	stringToKeyUsage := aStream next.
	stringToKeyUsage = 255 ifTrue: [
		encryptionAlgorithm := aStream next.
		stringToKeySpecifier := aStream nextS2KSpecifier].
	stringToKeyUsage = 0 ifFalse: [
		initialVector := aStream next: 8].
	self readMPIsFrom: aStream
]

{ #category : #reading }
OpenPGPSecretKeyPacket >> readMPIsFrom: aStream [
	mpis := ByteArray withAll: aStream upToEnd
]
