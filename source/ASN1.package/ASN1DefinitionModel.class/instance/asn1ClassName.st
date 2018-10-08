accessing
asn1ClassName
	"Answer the value of asn1ClassName"

	^ asn1ClassName ifNil: [asn1ClassName := self parseASN1ClassName. asn1ClassName]