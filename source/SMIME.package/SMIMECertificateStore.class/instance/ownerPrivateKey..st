accessing
ownerPrivateKey: pk

	| pki epki asn1 cipher |
	pki := Pkcs8PrivateKeyInfo new
		version: 0;
		privateKeyAlgorithm: (X509AlgorithmIdentifier new
			oid: (ASN1ObjectId fromString: '1.2.840.113549.1.7.1'));
		privateKey: (ASN1Stream encode: ((Array new: 9 withAll: 0)
			at: 5 put: pk p;
			at: 6 put: pk q;
			at: 7 put: pk dP;
			at: 8 put: pk dQ;
			at: 9 put: pk qInv;
			yourself));
		yourself.
	epki := Pkcs8EncryptedPrivateKeyInfo new
		encryptionAlgorithm: (X509AlgorithmIdentifier new
			oid: (ASN1ObjectId fromString: '1.2.840.113549.1.12.1.3');
			parameters: (OrderedCollection 
				with: (SecureRandom new nextBytes: 8) 
				with: 2000)
			yourself);
		yourself.
	asn1 := ASN1Stream 
		encode: pki
		withType: ((ASN1Module name: #pkcs) find: #KeyBag).
	cipher := epki cipherWithPassword: self password.
	epki encryptedData: (cipher encrypt: asn1).

	self storeData ownerPrivateKey: epki.
	self writeStoreData.
