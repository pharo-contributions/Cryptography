Extension { #name : #DSAPublicKey }

{ #category : #'*ASN1-Core' }
DSAPublicKey >> asAsn1Bytes [

	| algorithm keyInfo |
	algorithm := OrderedCollection 
		with: (ASN1ObjectId fromString: '1.2.840.10040.4.1') 
		with: self dssSig.
	keyInfo := OrderedCollection with: algorithm with: self subjectPublicKey.
	^ keyInfo asAsn1Bytes.

]

{ #category : #'*ASN1-Core' }
DSAPublicKey class >> fromAsnDerBytes: bytes [

	| collection algorithm dssSig p q g y |
	collection := ASN1Stream decodeBytes: bytes.
	algorithm := collection first.
	dssSig := algorithm last.
	(dssSig size = 3) ifFalse: [self error: 'incorrect number of dss parameters'].
	p := dssSig at: 1.
	q := dssSig at: 2.
	g := dssSig at: 3.
	y := ASN1Stream decodeBytes: collection last bytes.
	^ DSAPublicKey p: p q: q g: g y: y.

]

{ #category : #'*ASN1-Core' }
DSAPublicKey >> subjectPublicKey [

	^ ASN1BitString fromByteArray: y asAsn1Bytes
]
