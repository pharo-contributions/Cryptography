Extension { #name : #UndefinedObject }

{ #category : #'*ASN1' }
UndefinedObject >> asAsn1Bytes [

	^ ASN1Stream encode: self.

]

{ #category : #'*ASN1' }
UndefinedObject >> asn1Tag [

	^ 5
]
