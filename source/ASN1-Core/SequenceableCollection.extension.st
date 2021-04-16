Extension { #name : #SequenceableCollection }

{ #category : #'*ASN1-Core' }
SequenceableCollection >> asAsn1Bytes [

	^ ASN1Stream encode: self
]

{ #category : #'*ASN1-Core' }
SequenceableCollection >> asn1Tag [

	^ 48

]
