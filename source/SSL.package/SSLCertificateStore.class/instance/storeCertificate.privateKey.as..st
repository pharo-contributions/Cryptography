api
storeCertificate: cert privateKey: privateKey as: name

	self certificates at: name put: cert.
	self privateKeys at: name put: privateKey.
