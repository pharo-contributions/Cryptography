Class {
	#name : #ASN1BitString,
	#superclass : #ASN1Value,
	#instVars : [
		'bytes',
		'bitsPadding'
	],
	#category : #'ASN1-Core-Objects'
}

{ #category : #asn }
ASN1BitString class >> fromByteArray: bytes [

	^ self new
		  bytes: bytes;
		  yourself
]

{ #category : #initialization }
ASN1BitString >> , bitString [

	^ self class new
		bytes: self bytes, bitString bytes;
		bitsPadding: bitString bitsPadding;
		yourself.

]

{ #category : #'private - parsing' }
ASN1BitString >> = anotherBitString [

	^ self bytes = anotherBitString bytes
]

{ #category : #'private - parsing' }
ASN1BitString >> asn1Tag [

	^ 3

]

{ #category : #accessing }
ASN1BitString >> bitsPadding [
	"Answer the value of bitsPadding"

	^ bitsPadding
]

{ #category : #accessing }
ASN1BitString >> bitsPadding: anObject [
	"Set the value of bitsPadding"

	bitsPadding := anObject
]

{ #category : #accessing }
ASN1BitString >> bytes [
	"Answer the receiver's instance variable bytes."

	^bytes
]

{ #category : #accessing }
ASN1BitString >> bytes: anObject [
	"Set the receiver's instance variable bytes to anObject."

	bytes := anObject
]

{ #category : #initialization }
ASN1BitString >> initialize [

	self bitsPadding: 0.
	self bytes: (ByteArray new).

]

{ #category : #'private - parsing' }
ASN1BitString >> printOn: aStream [

	1 to: bytes size - 1 do: [:idx |
		aStream nextPutAll: ((self bytes at: idx) printStringBase: 2)].
	aStream nextPutAll: ((160 printStringBase: 2) copyFrom: 1 to: (8 - self bitsPadding))
]
