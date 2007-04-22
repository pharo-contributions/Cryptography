certificates
validateCertificateChain: certChain

	| childCert parentCert issuer |
	1 to: certChain size - 1 do: [:idx |
		childCert := certChain at: idx.
		parentCert := certChain at: idx + 1.
		(self validateCertificate: childCert fromParentCertificate: parentCert)
			ifFalse: [^false]].
	childCert := certChain last.
	issuer := childCert tbsCertificate issuer.
	parentCert := SSLCertificateStore new rootCerts 
		detect: [:eachCert | eachCert tbsCertificate subject = issuer] 
		ifNone: [childCert].
	^ self validateCertificate: childCert fromParentCertificate: parentCert.
