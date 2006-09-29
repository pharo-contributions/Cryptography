constants
nameFromVersionID: aByte
	"return the version name from the byte that is sent"
	aByte asInteger = 128 ifTrue: [^self ssl20constant].
	aByte asInteger = 22 ifTrue: [^self ssl30constant].
	self halt.