private
envelopedContentInfoFrom: mailMsg

	| contentEncryptionKey iv tdes encrypted encryptedContentInfo envelopedData addresses certs publicKey encryptedKey recipientInfo contentInfo |
	contentEncryptionKey := SecureRandom new nextBytesNonZero: 24.
	iv := SecureRandom new nextBytesNonZero: 8.
	tdes := (TripleDES key: contentEncryptionKey) cbc initialVector: iv copy.
	encrypted := tdes encrypt: mailMsg text withInternetLineEndings asByteArray.

	encryptedContentInfo := CMSEncryptedContentInfo new
		contentType: (ASN1ObjectId fromString: '1.2.840.113549.1.7.1');
		contentEncryptionAlgorithm: (X509AlgorithmIdentifier oidString: '1.2.840.113549.3.7' parameters: iv);
		encryptedContent: encrypted;
		yourself.
	envelopedData := CMSEnvelopedData new
		version: 0;
		recipientInfos: Set new;
		encryptedContentInfo: encryptedContentInfo;
		yourself.

	addresses := MailAddressParser addressesIn: mailMsg to.
	addresses do: [:eachAddr |
		certs := self certStore atEmail: eachAddr.
		publicKey := certs first tbsCertificate subjectPublicKeyInfo asPublicKey.
		encryptedKey := publicKey v15Encrypt: contentEncryptionKey.
		recipientInfo := CMSKeyTransRecipientInfo new
			version: 0;
			rid: (CMSIssuerAndSerialNumber certificate: certs first);
			keyEncryptionAlgorithm: (X509AlgorithmIdentifier oidString: '1.2.840.113549.1.1.1' parameters: ASN1Null new);
			encryptedKey: encryptedKey;
			yourself.
		envelopedData recipientInfos add: recipientInfo].

	contentInfo := CMSContentInfo new
		contentType: (ASN1ObjectId fromString: '1.2.840.113549.1.7.3');
		content: envelopedData;
		yourself.
	^ contentInfo
