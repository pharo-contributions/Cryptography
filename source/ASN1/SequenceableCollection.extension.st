Extension { #name : #SequenceableCollection }

{ #category : #'*ASN1' }
SequenceableCollection >> asAsn1Bytes [

	^ ASN1Stream encode: self.

]

{ #category : #'*ASN1' }
SequenceableCollection >> asn1Tag [

	^ 48

]
