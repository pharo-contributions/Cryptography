certificates
validateCertificate: childCert fromParentCertificate: parentCert

	(DateAndTime now 
		between: childCert tbsCertificate validity notBefore
		and: childCert tbsCertificate validity notAfter)
			ifFalse: [self sendAlertCode: 45. ^ false].
	childCert tbsCertificate issuer = parentCert tbsCertificate subject
		ifFalse: [^ false].
	^ childCert verifyFromParentCertificate: parentCert.
