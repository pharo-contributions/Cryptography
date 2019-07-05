Extension { #name : #Boolean }

{ #category : #'*ASN1' }
Boolean >> asAsn1Bytes [

	^ ASN1Stream encode: self.

]

{ #category : #'*ASN1' }
Boolean >> asn1Tag [

	^ 1

]
