accessing
asn1DefinitionString
	"Answer the value of asn1DefinitionString"

	^ asn1DefinitionString ifNil: [asn1DefinitionString := self parseASN1DefinitionString. asn1DefinitionString]