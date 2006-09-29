accessing
privateExponent_d: anObject
	"Set the value of privateExponent_d encrypt the value to make it harder to find in memory"
	| cText |
	cText := self encrypt: anObject.
	privateExponent_d := cText.