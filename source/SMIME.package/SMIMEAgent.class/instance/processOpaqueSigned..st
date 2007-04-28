private
processOpaqueSigned: mailMsg

	| contentInfo signedDigest cert publicKey certs fromEmails digest |
	contentInfo := ASN1Stream 
		decodeBytes: mailMsg body content asByteArray
		withType: ((ASN1Module name: #cms) find: #ContentInfo).
	certs := contentInfo content certificates asOrderedCollection.
	fromEmails := MailAddressParser addressesIn: mailMsg from.
	fromEmails do: [:fromEmail |
		self certStore atEmail: fromEmail putCerts: certs].

	digest := SHA1 hashMessage: contentInfo content encapContentInfo eContent.
	signedDigest := OrderedCollection new
		add: (OrderedCollection new 
			add: (ASN1ObjectId fromString: '1.3.14.3.2.26'); 
			add: nil; 
			yourself);
		add: digest;
		asAsn1Bytes. 
	contentInfo content signerInfos do: [:eachSignerInfo |
		cert := certs 
			detect: [:eachCert | eachSignerInfo sid matchesCertificate: eachCert]
			ifNone: [^ 'unknown certificate'].
		publicKey := cert tbsCertificate subjectPublicKeyInfo asPublicKey.
		(publicKey 
			v15VerifySignature: eachSignerInfo signature 
			ofMessageHash: signedDigest)
				ifFalse: [^ 'bad message hash']].
	^ (MailMessage from: contentInfo content encapContentInfo eContent asString withSqueakLineEndings)
		parseParts;
		yourself.
