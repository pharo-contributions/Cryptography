class initialization
initializeASN1Types

	| module |
	module := ASN1Module name: #cms.

	(module sequence: #EnvelopedData mapping: CMSEnvelopedData)
		add: #version type: #CMSVersion;
		addOptional: #originatorInfo type: #OriginatorInfo implicitTag: 0;
		add: #recipientInfos type: #RecipientInfos;
		add: #encryptedContentInfo type: #EncryptedContentInfo;
		addOptional: #unprotectedAttrs type: #UnprotectedAttributes implicitTag: 1;
		yourself.

	(module sequence: #OriginatorInfo mapping: CMSOriginatorInfo)
		addOptional: #certs type: #CertificateSet implicitTag: 0;
		addOptional: #crls type: #RevocationInfoChoices implicitTag: 1;
		yourself.

	module set: #RecipientInfos of: #RecipientInfo.
	module set: #UnprotectedAttributes of: #Attribute.

	(module choice: #RecipientInfo)
		add: #ktri type: #KeyTransRecipientInfo;
		add: #kari type: #KeyAgreeRecipientInfo;
		add: #kekri type: #KEKRecipientInfo;
		add: #pwri type: #PasswordRecipientInfo;
		add: #ori type: #OtherRecipientInfo;
		yourself.

	(module sequence: #KeyTransRecipientInfo mapping: CMSKeyTransRecipientInfo)
		add: #version type: #CMSVersion;
		add: #rid type: #RecipientIdentifier;
		add: #keyEncryptionAlgorithm type: #KeyEncryptionAlgorithmIdentifier;
		add: #encryptedKey type: #EncryptedKey;
		yourself.
	module byteArray: #EncryptedKey.
	(module choice: #RecipientIdentifier)
		add: #issuerAndSerialNumber type: #IssuerAndSerialNumber;
		add: #subjectKeyIdentifier type: #SubjectKeyIdentifier implicitTag: 0;
		yourself.
	module assign: #KeyEncryptionAlgorithmIdentifier from: #AlgorithmIdentifier.
