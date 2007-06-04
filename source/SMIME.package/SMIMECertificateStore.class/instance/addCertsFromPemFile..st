reading/writing
addCertsFromPemFile: filename

	| certReader |
	certReader := X509CertificateDerReader fromFile: filename.
	self ownerCerts add: certReader asCertificate.
	self writeStoreData.
