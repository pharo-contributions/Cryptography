certificates
validateCertificate: childCert fromParentCertificate: parentCert

	(DateAndTime now 
		between: childCert tbsCertificate validity notBefore
		and: childCert tbsCertificate validity notAfter)
			ifFalse: [self sendAlertCode: 46. ^ false].
	childCert tbsCertificate issuer = parentCert tbsCertificate subject
		ifFalse: [
			self sendAlertCode: 46.
			^ false].
	^ childCert verifyFromParentCertificate: parentCert.
