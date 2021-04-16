Class {
	#name : #ASN1ChoiceType,
	#superclass : #ASN1StructuredType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1ChoiceType >> decodeValueWithDERStream: derStream length: length [

	| aTag ele |
	aTag := derStream currentTag bitAnd: 2r00011111.
	ele := self elements
		       detect: [ :x | x matchesTag: aTag ]
		       ifNone: [ self error: 'no choice' ].
	^ ele decodeValueWithDERStream: derStream length: length
]

{ #category : #decoding }
ASN1ChoiceType >> decodeWithDERStream: derStream [

	| aTag ele |
	aTag := derStream peekTag.
	ele := self elements
		       detect: [ :x | x matchesTag: aTag ]
		       ifNone: [ self error: 'no choice' ].
	^ ele decodeWithDERStream: derStream
]

{ #category : #encoding }
ASN1ChoiceType >> encode: anObject withDERStream: derStream [

	| ele |
	ele := self elements
		       detect: [ :x | x isTypeFor: anObject ]
		       ifNone: [ self error: 'no choice' ].
	ele encode: anObject withDERStream: derStream
]

{ #category : #testing }
ASN1ChoiceType >> matchesTag: aTag [

	^ elements anySatisfy: [ :e | e matchesTag: aTag ]
]

{ #category : #private }
ASN1ChoiceType >> newElement [

	^ ASN1ChoiceElement new
]
