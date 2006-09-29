services
getCertificate
	
	| blobString aCertificate aByteArray hexString |
	self openCertSelect.
	self selectedCertificate ifNil: [^nil].
	self exportKey.
	blobString := (1 to: self exportedKeySize) collect: [:i | | aByte |  aByte := self exportedKey byteAt: i. self exportedKey byteAt: i put: 0. aByte].
	aByteArray := blobString asByteArray.
	blobString := String new.
	hexString := aByteArray hex.
	aByteArray destroy.
	aCertificate := MSCertificate fromBlobString: hexString.
	aCertificate asn1EncodedCertificate: self selectedCertificate asn1EncodedCertificate.
	hexString := String new.
	self closeStore.
	^aCertificate
	
	