Extension { #name : #Set }

{ #category : #'*ASN1-Core' }
Set >> asAsn1Bytes [

	^ ASN1Stream encode: self.

]

{ #category : #'*ASN1-Core' }
Set >> asn1Tag [

	^ 49

]
