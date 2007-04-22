initialize-release
asAsn1Bytes

	| type |
	type := (ASN1Module name: #x509) find: #TBSCertificate.
	^ ASN1Stream encode: self withType: type
