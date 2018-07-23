verifying
verifyMD5WithRSAEncryptionFromParentCertificate: parentCert

	| publicKey hash msg |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.
	hash := MD5 hashMessage: self tbsCertificate asAsn1Bytes.
	msg := OrderedCollection new
		add: (OrderedCollection new add: (ASN1ObjectId fromString: '1.2.840.113549.2.5'); add: nil; yourself);
		add: hash;
		asAsn1Bytes.
	^ publicKey v15VerifySignature: self signature bytes ofMessageHash: msg.
