comparing
matchesCertificate: cert

	^ cert tbsCertificate issuer = self issuer
		and: [cert tbsCertificate serialNumber = self serialNumber]
