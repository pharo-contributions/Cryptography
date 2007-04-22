accessing
ownerPublicKey

	^ self ownerCert tbsCertificate subjectPublicKeyInfo asPublicKey.
