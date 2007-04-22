encoding
sizeOfObject: anObject

	| derStream |
	derStream := ASN1Stream new.
	anObject tagValue do: [:each |
		derStream encode: each].
	^ derStream size