testing
isTypeFor: anObject

	| val |
	val := self valueFrom: anObject.
	^self type isTypeFor: val