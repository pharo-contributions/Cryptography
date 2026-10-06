Extension { #name : #UndefinedObject }

{ #category : #'*ASN1-Core' }
UndefinedObject >> asAsn1Bytes [

	^ ASN1Stream encode: self
]

{ #category : #'*ASN1-Core' }
UndefinedObject >> asn1Tag [

	^ 5
]
