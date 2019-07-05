Extension { #name : #DateAndTime }

{ #category : #'*ASN1' }
DateAndTime >> asAsn1Bytes [

	^ ASN1Stream encode: self.

]

{ #category : #'*ASN1' }
DateAndTime >> asn1Tag [

	^ 23

]
