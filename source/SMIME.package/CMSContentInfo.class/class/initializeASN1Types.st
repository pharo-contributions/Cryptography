class initialization
initializeASN1Types

	| module |
	module := ASN1Module name: #cms.
	module addImport: (ASN1Module name: #x509).

	(module sequence: #ContentInfo mapping: CMSContentInfo)
		add: #contentType type: #ContentType;
		add: #content type: #ContentInfoContents explicitTag: 0;
		yourself.
	module objectIdentifier: #ContentType.
	(module any: #ContentInfoContents definedBy: #contentType)
		at: (ASN1ObjectId fromString: '1.2.840.113549.1.7.1') put: #ASN1ByteArrayType;
		at: (ASN1ObjectId fromString: '1.2.840.113549.1.7.2') put: #SignedData;
		at: (ASN1ObjectId fromString: '1.2.840.113549.1.7.3') put: #EnvelopedData;
		at: (ASN1ObjectId fromString: '1.2.840.113549.1.7.5') put: #DigestedData;
		at: (ASN1ObjectId fromString: '1.2.840.113549.1.7.6') put: #EncryptedData;
		at: (ASN1ObjectId fromString: '1.2.840.113549.1.9.16.1.2') put: #AuthenticatedData;
		yourself.
