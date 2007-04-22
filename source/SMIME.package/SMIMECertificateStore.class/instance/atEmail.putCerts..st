accessing
atEmail: email putCerts: certs

	self storeData certificateMap at: email put: certs.
	self writeStoreData.
