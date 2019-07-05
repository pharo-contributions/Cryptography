"
My instances are RSA algorithms.
"
Class {
	#name : #RSAPublicKey,
	#superclass : #Object,
	#instVars : [
		'exponent',
		'modulo'
	],
	#category : 'Cryptography-RSA'
}

{ #category : #'instance creation' }
RSAPublicKey class >> exponent: anInteger modulo: anotherInteger [
	^ self new setExponent: anInteger modulo: anotherInteger
]

{ #category : #accessing }
RSAPublicKey >> bits [
	^ modulo highBit
]

{ #category : #process }
RSAPublicKey >> crypt: anInteger [
	^ anInteger raisedTo: exponent modulo: modulo
]

{ #category : #accessing }
RSAPublicKey >> exponent [
	^ exponent
]

{ #category : #accessing }
RSAPublicKey >> modulo [
	^ modulo
]

{ #category : #initialization }
RSAPublicKey >> setExponent: anInteger modulo: anotherInteger [
	exponent := anInteger.
	modulo := anotherInteger
]

{ #category : #process }
RSAPublicKey >> v15Decrypt: aByteArray [

	| em stream |
	em := self crypt: aByteArray asInteger.
	stream := em asByteArray readStream.
	stream upTo: 16r02.
	stream upTo: 16r00.
	^ stream upToEnd.

]

{ #category : #process }
RSAPublicKey >> v15Encrypt: aByteArray [

	| em k ps | 
	k := self modulo asByteArray size.
	ps := SecureRandom new nextBytesNonZero: (k - aByteArray size - 3).
	em := 16r00 asByteArray, 16r02 asByteArray, ps, 16r00 asByteArray, aByteArray.
	^ (self crypt: em asInteger) asByteArray.

]

{ #category : #process }
RSAPublicKey >> v15SignMessage: aMessage [

	^ self v15SignMessageHash: (
		SHA1 digestInfoAsn1DerEncodingFromMessage: aMessage).

]

{ #category : #process }
RSAPublicKey >> v15SignMessageHash: encodedMsg [

	| padded toBeSigned |
	padded := ByteArray new: (256 - encodedMsg size - 3) withAll: 255.
	toBeSigned := #(0) asByteArray, #(1) asByteArray, padded, #(0) asByteArray, encodedMsg.
	^ (self crypt: toBeSigned asInteger) asByteArray.

]

{ #category : #process }
RSAPublicKey >> v15Verify: aSignature isSignatureOf: aMessage [
	"Answer true if the given signature string signs the given message."

	^ self 
		v15VerifySignature: aSignature 
		ofMessageHash: (
			SHA1 digestInfoAsn1DerEncodingFromMessage: aMessage).

]

{ #category : #process }
RSAPublicKey >> v15VerifySignature: aSignature ofMessageHash: encodedMsg [
	"Answer true if the given signature string signs the given message (a stream or string)."
	"Note: Random numbers are not needed for signature verification; thus, there is no need to call initRandomFromUser before verifying a signature."

	| bytes signedMsg |
	bytes := (self crypt: aSignature asInteger) asByteArray.
	signedMsg := bytes readStream upTo: 1; upTo: 0; upToEnd.
	^ encodedMsg = signedMsg

]
