verifying
verifySHA1WithDSAEncryptionFromParentCertificate: parentCert

	| publicKey sig toBeSigned |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.
	sig := ASN1Stream decodeBytes: self signature bytes.
	toBeSigned := SHA1 hashMessage: self tbsCertificate asAsn1Bytes.
	^ publicKey verifySignature: sig ofMessageHash: toBeSigned.
