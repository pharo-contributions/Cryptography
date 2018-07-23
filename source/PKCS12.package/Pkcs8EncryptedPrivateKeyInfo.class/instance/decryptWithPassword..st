api
decryptWithPassword: password

	| cipher asn1 |
	cipher := self cipherWithPassword: password.
	asn1 := cipher decrypt: self encryptedData.
	^ ASN1Stream 
		decodeBytes: asn1
		withType: ((ASN1Module name: #pkcs) find: #KeyBag)