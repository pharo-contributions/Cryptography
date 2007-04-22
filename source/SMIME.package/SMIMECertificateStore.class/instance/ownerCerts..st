accessing
ownerCerts: certs

	self storeData ownerCertificateList: certs.
	self writeStoreData.
