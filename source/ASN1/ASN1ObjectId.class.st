Class {
	#name : #ASN1ObjectId,
	#superclass : #ASN1Value,
	#instVars : [
		'oid',
		'description'
	],
	#category : 'ASN1-Objects'
}

{ #category : #asn }
ASN1ObjectId class >> fromString: oidString [

	^ self new
		oid: oidString;
		initializeDescription;
		yourself
]

{ #category : #'private - parsing' }
ASN1ObjectId >> = anotherOid [
	^anotherOid class = self class and: [self oid = anotherOid oid]
]

{ #category : #'private - parsing' }
ASN1ObjectId >> asByteArray [

	| dataStream oidTokens b n lengthStream bytes |
	dataStream := WriteStream on: (ByteArray new: 16).
	oidTokens := self oid tokensBasedOn: $..
	dataStream nextPut: (((oidTokens at: 1) asInteger * 40) + (oidTokens at: 2) asInteger).
	3 to: oidTokens size do: [:i | 
		b := (oidTokens at: i) asInteger.
		(b <= 16r7F)
			ifTrue: [dataStream nextPut: b]
			ifFalse: [
				n := b.
				lengthStream := WriteStream on: (ByteArray new: 4).
				lengthStream nextPut: (n \\ 128).
				[n := n bitShift: -7.
				(n bitShift: -7) = 0] 
					whileFalse: [lengthStream nextPut: ((n \\ 128) bitOr: 16r80)].
				lengthStream nextPut: ((n \\ 128) bitOr: 16r80).
				bytes := lengthStream contents reversed.
				dataStream 
					nextPutAll: bytes ]].
	^ dataStream contents.

]

{ #category : #'private - parsing' }
ASN1ObjectId >> asn1Tag [

	^ 6

]

{ #category : #accessing }
ASN1ObjectId >> description [
	"Answer the receiver's instance variable description."

	^description
]

{ #category : #accessing }
ASN1ObjectId >> description: anObject [
	"Set the receiver's instance variable description to anObject."

	description := anObject
]

{ #category : #'private - parsing' }
ASN1ObjectId >> hash [

	^ self oid hash
]

{ #category : #'private - parsing' }
ASN1ObjectId >> initializeDescription [


"	oid := 'x', self getOID.
	ix := 1.
	[ix < oid size]
		whileTrue: [
			((oid at: ix) = $.)
				ifTrue: [oid at: ix put: $x].
			ix := ix + 1.
		].
	(ASN1ObjectIdentifiers includesKey: oid asSymbol)
		ifTrue: [^ASN1ObjectIdentifiers at: oid asSymbol]
		ifFalse: [^self getOID]"
]

{ #category : #accessing }
ASN1ObjectId >> oid [
	"Answer the receiver's instance variable oid."

	^oid
]

{ #category : #accessing }
ASN1ObjectId >> oid: anObject [
	"Set the receiver's instance variable oid to anObject."

	oid := anObject
]

{ #category : #'private - parsing' }
ASN1ObjectId >> printOn: aStream [

	aStream nextPutAll: self oid
]
