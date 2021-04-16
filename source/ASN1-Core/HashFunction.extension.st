Extension { #name : #HashFunction }

{ #category : #'*ASN1-Core' }
HashFunction class >> digestInfoAsn1DerEncodingFromMessage: msg [

	^ (self digestInfoFromMessage: msg) asAsn1Bytes
]

{ #category : #'*ASN1-Core' }
HashFunction class >> digestInfoFromMessage: msg [

	^ (OrderedCollection 
		with: (OrderedCollection with: self oid with: nil)
		with: (self hashMessage: msg))

]

{ #category : #'*ASN1-Core' }
HashFunction class >> doubleHashMessage: aStringOrByteArray [ 
	^ self new doubleHashMessage: aStringOrByteArray
]

{ #category : #'*ASN1-Core' }
HashFunction class >> oid [

	^ ASN1ObjectId fromString: self oidString.

]

{ #category : #'*ASN1-Core' }
HashFunction class >> oidString [

	^ self subclassResponsibility
]
