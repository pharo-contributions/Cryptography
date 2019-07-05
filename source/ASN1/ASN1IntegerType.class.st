Class {
	#name : #ASN1IntegerType,
	#superclass : #ASN1BasicType,
	#category : 'ASN1-Types'
}

{ #category : #decoding }
ASN1IntegerType >> decodeValueWithDERStream: derStream length: length [

	| integer |
	integer := Integer new: length neg: false.
	length to: 1 by: -1 do: [:index |
		integer digitAt: index put: derStream next].
	((integer digitAt: length) allMask: 16r80)
		ifTrue: [^integer twosComplement negated normalize]
		ifFalse: [^integer normalize].

]

{ #category : #encoding }
ASN1IntegerType >> encodeValue: anObject withDERStream: derStream [

	| integer |
	integer := anObject.
	integer positive
		ifTrue: [
			(integer lastDigit allMask: 16r80) 
				ifTrue: [derStream nextPut: 0]]
		ifFalse: [
			integer := integer negated twosComplement.
			(integer lastDigit noMask: 16r80)
				ifTrue: [derStream nextPut: 16rFF]].
	integer digitLength to: 1 by: -1 do: [:digitIndex |
		derStream nextPut: (integer digitAt: digitIndex)].

]

{ #category : #testing }
ASN1IntegerType >> isTypeFor: anObject [

	^ anObject isInteger
]

{ #category : #encoding }
ASN1IntegerType >> sizeOfObject: anObject [

	| twosComplement |
	^ anObject positive
		ifTrue: [(anObject lastDigit allMask: 16r80)
			ifTrue: [anObject digitLength + 1]
			ifFalse: [anObject digitLength]]
		ifFalse: [
			twosComplement := anObject negated twosComplement.
			(twosComplement lastDigit noMask: 16r80)
				ifTrue: [twosComplement digitLength+1]
				ifFalse: [twosComplement digitLength]].


]

{ #category : #accessing }
ASN1IntegerType >> tag [

	^ 2
]
