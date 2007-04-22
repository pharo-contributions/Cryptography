accessing
subjectPublicKeyDecoded

	^ ASN1Stream decodeBytes: self subjectPublicKey bytes.
