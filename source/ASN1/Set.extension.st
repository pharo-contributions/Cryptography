Extension { #name : #Set }

{ #category : #'*ASN1' }
Set >> asAsn1Bytes [

	^ ASN1Stream encode: self.

]

{ #category : #'*ASN1' }
Set >> asn1Tag [

	^ 49

]
