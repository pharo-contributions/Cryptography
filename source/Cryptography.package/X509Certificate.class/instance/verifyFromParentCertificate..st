verifying
verifyFromParentCertificate: parentCert

	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.2')
		ifTrue: [^ self verifyMD2WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.4')
		ifTrue: [^ self verifyMD5WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.5')
		ifTrue: [^ self verifySHA1WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.10040.4.3')
		ifTrue: [^ self verifySHA1WithDSAEncryptionFromParentCertificate: parentCert].
	^ false.
