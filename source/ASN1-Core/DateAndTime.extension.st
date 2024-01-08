Extension { #name : #DateAndTime }

{ #category : #'*ASN1-Core' }
DateAndTime >> asAsn1Bytes [

	^ ASN1Stream encode: self
]

{ #category : #'*ASN1-Core' }
DateAndTime >> asn1Tag [

	^ 23

]
