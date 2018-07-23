converting
asAsn1Bytes

	| type |
	type := (ASN1Module name: #x509) find: #Certificate.
	^ ASN1Stream encode: self withType: type
