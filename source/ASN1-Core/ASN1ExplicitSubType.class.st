Class {
	#name : #ASN1ExplicitSubType,
	#superclass : #ASN1SubType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1ExplicitSubType >> decodeWithDERStream: derStream [

	derStream nextTag.
	derStream nextLength.
	^ self parent decodeWithDERStream: derStream.

]

{ #category : #decoding }
ASN1ExplicitSubType >> decodeWithDERStream: derStream owner: owner ownerType: ownerType [

	derStream nextTag.
	derStream nextLength.
	^ self parent decodeWithDERStream: derStream owner: owner ownerType: ownerType.

]

{ #category : #encoding }
ASN1ExplicitSubType >> encode: anObject withDERStream: derStream [

	| tempStream |
	derStream nextPutTag: (self asn1Tag bitOr: 160).
	tempStream := derStream newStream.
	self parent encode: anObject withDERStream: tempStream.
	derStream nextPutLength: tempStream size.
	derStream nextPutAll: tempStream contents.

]

{ #category : #encoding }
ASN1ExplicitSubType >> encode: anObject withDERStream: derStream owner: owner ownerType: ownerType [

	| tempStream |
	derStream nextPutTag: (self asn1Tag bitOr: 160).
	tempStream := derStream newStream.
	self parent encode: anObject withDERStream: tempStream owner: owner ownerType: ownerType.
	derStream nextPutLength: tempStream size.
	derStream nextPutAll: tempStream contents.

]
