private
processSigned: mailMsg

	| textMsg sigMsg contentInfo textDigest signedDigest cert publicKey signedAttrsDer hashAttr certs fromEmails |
	textMsg := mailMsg parts 
		detect: [:e | e body contentType = 'text/plain'] 
		ifNone: [nil].
	sigMsg := mailMsg parts 
		detect: [:e | e body contentType = 'application/pkcs7-signature'] 
		ifNone: [nil].

	contentInfo := ASN1Stream 
		decodeBytes: sigMsg body content asByteArray
		withType: ((ASN1Module name: #cms) find: #ContentInfo).
	certs := contentInfo content certificates asOrderedCollection.
	fromEmails := MailAddressParser addressesIn: mailMsg from.
	fromEmails do: [:fromEmail |
		self certStore atEmail: fromEmail putCerts: certs].

	cert := certs first.
	publicKey := cert tbsCertificate subjectPublicKeyInfo asPublicKey.
	textDigest := SHA1 hashMessage: textMsg text withInternetLineEndings.
	contentInfo content signerInfos do: [:eachSignerInfo |
		hashAttr := eachSignerInfo signedAttrs
			detect: [:eachAttr | eachAttr attrType oid = '1.2.840.113549.1.9.4']
			ifNone: [nil].
		hashAttr notNil ifTrue: [
			hashAttr attrValues asOrderedCollection first = textDigest
				ifFalse: [^ 'bad message hash']].
		signedAttrsDer := (ASN1Stream 
			encode: eachSignerInfo signedAttrs
			withType: ((ASN1Module name: #cms) find: #SignedAttributes)).
		signedAttrsDer at: 1 put: 49.
		signedDigest := SHA1 hashMessage: signedAttrsDer.
		signedDigest := OrderedCollection new
			add: (OrderedCollection new 
				add: (ASN1ObjectId fromString: '1.3.14.3.2.26'); 
				add: nil; 
				yourself);
			add: signedDigest;
			asAsn1Bytes.
		(publicKey 
			v15VerifySignature: eachSignerInfo signature 
			ofMessageHash: signedDigest)
				ifFalse: [^ 'bad message hash']].
	^ mailMsg
