class initialization
initializeASN1Types

	| module |
	module := ASN1Module name: #cms.

	(module sequence: #SignedData mapping: CMSSignedData)
		add: #version type: #CMSVersion;
		add: #digestAlgorithms type: #DigestAlgorithmIdentifiers;
		add: #encapContentInfo type: #EncapsulatedContentInfo;
		addOptional: #certificates type: #CertificateSet implicitTag: 0;
		addOptional: #crls type: #RevocationInfoChoices implicitTag: 1;
		add: #signerInfos type: #SignerInfos;
		yourself.
	module integer: #CMSVersion.
	module set: #DigestAlgorithmIdentifiers of: #DigestAlgorithmIdentifier.
	module assign: #DigestAlgorithmIdentifier from: #AlgorithmIdentifier.
	(module sequence: #EncapsulatedContentInfo mapping: CMSEncapsulatedContentInfo)
		add: #eContentType type: #ContentType;
		addOptional: #eContent type: #ASN1ByteArrayType explicitTag: 0;
		yourself.

	module set: #SignerInfos of: #SignerInfo.
	(module sequence: #SignerInfo mapping: CMSSignerInfo)
		add: #version type: #CMSVersion;
		add: #sid type: #SignerIdentifier;
		add: #digestAlgorithm type: #DigestAlgorithmIdentifier;
		addOptional: #signedAttrs type: #SignedAttributes implicitTag: 0;
		add: #signatureAlgorithm type: #SignatureAlgorithmIdentifier;
		add: #signature type: #SignatureValue;
		addOptional: #unsignedAttrs type: #UnsignedAttributes implicitTag: 1;
		yourself.
	(module choice: #SignerIdentifier)
		add: #issuerAndSerialNumber type: #IssuerAndSerialNumber;
		add: #subjectKeyIdentifier type: #SubjectKeyIdentifier;
		yourself.
	(module sequence: #IssuerAndSerialNumber mapping: CMSIssuerAndSerialNumber)
		add: #issuer type: #Name;
		add: #serialNumber type: #CertificateSerialNumber;
		yourself.

	module byteArray: #SubjectKeyIdentifier.
	module assign: #SignatureAlgorithmIdentifier from: #AlgorithmIdentifier.
	module byteArray: #SignatureValue.

	module any: #AttributeValue.
	module set: #AttributeValues of: #AttributeValue.
	(module sequence: #Attribute mapping: CMSAttribute)
		add: #attrType type: #ASN1ObjectIdentifierType;
		add: #attrValues type: #AttributeValues;
		yourself.
	module set: #SignedAttributes of: #Attribute.
	module set: #UnsignedAttributes of: #Attribute.

	module set: #CertificateSet of: #CertificateChoices.
	(module choice: #CertificateChoices)
		add: #certificate type: #Certificate;
		add: #extendedCertificate type: #ExtendedCertificate implicitTag: 0;
		add: #v1AttrCert type: #AttributeCertificateV1 implicitTag: 1;
		add: #v2AttrCert type: #AttributeCertificateV2 implicitTag: 2;
		add: #other type: #OtherCertificateFormat implicitTag: 3;
		yourself.
	module assign: #AttributeCertificateV2 from: #AttributeCertificate.
	(module sequence: #OtherCertificateFormat mapping: CMSOtherCertificateFormat)
		add: #otherCertFormat type: #ASN1ObjectIdentifierType;
		add: #otherCert type: #OtherCertAny;
		yourself.
	(module any: #OtherCertAny definedBy: #otherCertFormate)
		yourself.

	module set: #RevocationInfoChoices of: #RevocationInfoChoice.
	(module choice: #RevocationInfoChoice)
		add: #crl type: #CertificateList;
		add: #other type: #OtherRevocationInfoFormat implicitTag: 1;
		yourself.
	(module sequence: #OtherRevocationInfoFormat mapping: CMSOtherRevocationInfoFormat)
		add: #otherRevInfoFormat type: #ASN1ObjectIdentifierType;
		add: #otherRevInfo type: #OtherRevInfoAny;
		yourself.
	(module any: #OtherRevInfoAny definedBy: #otherRevInfoFormat)
		yourself.
