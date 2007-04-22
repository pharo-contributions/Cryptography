process
processServerCertificateMsg: certMsg forCoord: coord

	| cert |
	cert := certMsg certificateList first.
	publicKey := cert tbsCertificate subjectPublicKeyInfo asPublicKey.
