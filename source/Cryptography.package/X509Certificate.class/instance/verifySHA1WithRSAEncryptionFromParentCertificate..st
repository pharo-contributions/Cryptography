verifying
verifySHA1WithRSAEncryptionFromParentCertificate: parentCert

	| publicKey hash msg |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.

	hash := SHA1 hashMessage: self tbsCertificate asAsn1Bytes.
	msg := OrderedCollection new
		add: (OrderedCollection new add: (ASN1ObjectId fromString: '1.3.14.3.2.26'); add: nil; yourself);
		add: hash;
		asAsn1Bytes.
	^ publicKey v15VerifySignature: self signature bytes ofMessageHash: msg.
