initialize-release
initializeRootCerts

	self class rootCertSources do: [:eachSrc |
		self rootCerts add: (X509CertificateDerReader new 
			initializeFromFileContents: eachSrc) asCertificate].
