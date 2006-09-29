accessing
privateExponent_d
	"Answer the value of privateExponent_d"
	| pText |
	pText := self decrypt: privateExponent_d.
	^pText