testing
validateOwnerCertChain

	| certs childCert parentCert |
	certs := self ownerCerts.
	1 to: certs size - 1 do: [:idx |
		childCert := certs at: idx.
		parentCert := certs at: idx + 1.
		(childCert verifyFromParentCertificate: parentCert)
			ifFalse: [^ false]].
	childCert := certs last.
	parentCert := self rootCertificates 
		detect: [:eachCert | eachCert tbsCertificate subject = childCert tbsCertificate issuer] 
		ifNone: [childCert].
	^ childCert verifyFromParentCertificate: parentCert.
