instance creation
certificate: cert

	^ self new
		issuer: cert tbsCertificate issuer;
		serialNumber: cert tbsCertificate serialNumber;
		yourself.
