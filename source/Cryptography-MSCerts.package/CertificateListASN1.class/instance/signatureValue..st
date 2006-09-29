accessing
signatureValue: anObject
	"Set the value of signatureValue"
	<asn1FieldMutator: 'signature' class: #ASN1BitString>
	signatureValue := anObject