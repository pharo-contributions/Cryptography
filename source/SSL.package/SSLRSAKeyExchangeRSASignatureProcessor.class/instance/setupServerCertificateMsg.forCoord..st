process
setupServerCertificateMsg: certMsg forCoord: coord

	| cert |
	cert := coord certificateStore certificateAt: #rsa.
	privateKey := coord certificateStore privateKeyAt: #rsa.
	publicKey := cert tbsCertificate subjectPublicKeyInfo asPublicKey.
	certMsg certificateList: (OrderedCollection with: cert).
	^ certMsg
