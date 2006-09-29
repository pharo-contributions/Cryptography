parsing
classForType: anInteger
	"return a subclass for specialized hello extensions"
	^self subclasses detect: [:a | a myType = anInteger] ifNone: [self]