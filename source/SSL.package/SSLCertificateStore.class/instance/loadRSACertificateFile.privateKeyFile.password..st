api
loadRSACertificateFile: certFile privateKeyFile: privateKeyFile password: password

	| cert privateKey |
	cert := (X509CertificateDerReader fromFile: certFile) asCertificate.
	privateKey := (RSAPrivateKeyFileReader fromFile: privateKeyFile)
		password: password;
		asPrivateKey.
	self storeCertificate: cert privateKey: privateKey as: #rsa.
