exporting
asn1EncodedCertificate
	| pubCert |
	pubCert := self pbCertEncoded getHandle.
	^(1 to: self cbCertEncoded) collect: [:i | pubCert byteAt: i].
