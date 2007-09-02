initialize-release
loadDSACertificateFile: certFile privateKeyFile: pkFile

	publicKey := (X509CertificateDerReader fromFile: certFile) asCertificate tbsCertificate subjectPublicKeyInfo asDSAPublicKey.
	privateKey := (DSAPrivateKeyFileReader fromFile: pkFile) asPrivateKey.
