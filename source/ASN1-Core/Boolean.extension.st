Extension { #name : #Boolean }

{ #category : #'*ASN1-Core' }
Boolean >> asAsn1Bytes [

	^ ASN1Stream encode: self.

]

{ #category : #'*ASN1-Core' }
Boolean >> asn1Tag [

	^ 1

]
