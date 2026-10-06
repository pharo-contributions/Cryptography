Class {
	#name : #ASN1UTCTimeType,
	#superclass : #ASN1BasicType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1UTCTimeType >> decodeValueWithDERStream: derStream length: length [

	| aUTCDateTime |
	aUTCDateTime := (derStream next: length) asByteArray asString.
	^ (DateAndTime readFromString: (
		((aUTCDateTime copyFrom: 1 to: 2) asInteger > 50 ifTrue: ['19'] ifFalse: ['20']),
		(aUTCDateTime copyFrom: 1 to: 2), '-',
		(aUTCDateTime copyFrom: 3 to: 4), '-',
		(aUTCDateTime copyFrom: 5 to: 6), 'T',
		(aUTCDateTime copyFrom: 7 to: 8), ':',
		(aUTCDateTime copyFrom: 9 to: 10), ':',
		(aUTCDateTime copyFrom: 11 to: 12), 'Z'))


]

{ #category : #encoding }
ASN1UTCTimeType >> encodeValue: anObject withDERStream: derStream [

	| yy mo dd hh mm ss utcDateTime |
	yy := anObject year asString copyFrom: 3 to: 4.
	mo := anObject month asString padded: #left to: 2 with: $0.
	dd := anObject dayOfMonth asString padded: #left to: 2 with: $0.
	hh := anObject hour asString padded: #left to: 2 with: $0.
	mm := anObject minute asString padded: #left to: 2 with: $0.
	ss := anObject seconds asString padded: #left to: 2 with: $0.
	utcDateTime := (yy , mo , dd , hh , mm , ss , 'Z') asByteArray.
	derStream nextPutAll: utcDateTime
]

{ #category : #testing }
ASN1UTCTimeType >> isTypeFor: anObject [

	^ anObject isKindOf: DateAndTime
]

{ #category : #encoding }
ASN1UTCTimeType >> sizeOfObject: anObject [

	^ 13
]

{ #category : #accessing }
ASN1UTCTimeType >> tag [

	^ 23
]
