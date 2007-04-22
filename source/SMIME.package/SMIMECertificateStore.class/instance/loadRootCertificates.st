reading/writing
loadRootCertificates

	| rootDir |
	rootDir := (FileDirectory default directoryNamed: 'certificates') directoryNamed: 'roots'.
	rootDir fileNames do: [:eachFile | 
		[self rootCertificates add: (X509CertificateDerReader fromFile: (rootDir fullNameFor: eachFile)) asCertificate] 
			on: Error 
			do: [:ex | nil]]
