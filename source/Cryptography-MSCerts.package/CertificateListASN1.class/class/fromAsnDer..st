ASN1
fromAsnDer: aStream
	"return an instance created from aStream as defined by asn1Definition"
	^(ASN1DefinitionModel on: self) fromAsnDer: aStream