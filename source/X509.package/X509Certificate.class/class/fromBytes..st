instance creation
fromBytes: bytes

	| type |
	type := (ASN1Module name: #x509) find: #Certificate.
	^ ASN1Stream decodeBytes: bytes withType: type.
