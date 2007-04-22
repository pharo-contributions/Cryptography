*cryptography-core-accessing
load: anInteger
	"Set my contents to the value of given integer."

	low _ anInteger bitAnd: 16rFFFF.
	hi _ (anInteger bitShift: -16) bitAnd: 16rFFFF.
	self asInteger = anInteger
		ifFalse: [self error: 'out of range: ', anInteger printString].
