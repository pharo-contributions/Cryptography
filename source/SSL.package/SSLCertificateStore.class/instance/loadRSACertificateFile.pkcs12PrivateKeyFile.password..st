api
loadRSACertificateFile: certFile pkcs12PrivateKeyFile: privateKeyFile password: password

	| cert privateKey |
	cert := (X509CertificateDerReader fromFile: certFile) asCertificate.
	privateKey := (Pkcs12PrivateKeyFileReader fromFile: privateKeyFile)
		password: password;
		asPrivateKey.
	self storeCertificate: cert privateKey: privateKey as: #rsa.
