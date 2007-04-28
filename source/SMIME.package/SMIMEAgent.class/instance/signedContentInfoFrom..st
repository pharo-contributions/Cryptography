private
signedContentInfoFrom: mailMsg

	| textDigest signerInfo attr signedAttrsDer signedDigest signedData contentInfo |
	textDigest := SHA1 hashMessage: mailMsg text withInternetLineEndings.

	signerInfo := CMSSignerInfo new.
	signerInfo version: 1.
	signerInfo sid: (CMSIssuerAndSerialNumber certificate: self certStore ownerCert).
	signerInfo digestAlgorithm: (X509AlgorithmIdentifier oidString: '1.3.14.3.2.26' parameters: ASN1Null new).
	signerInfo signedAttrs: OrderedCollection new.
	attr := CMSAttribute new
		attrType: (ASN1ObjectId fromString: '1.2.840.113549.1.9.3');
		attrValues: (Set with: (ASN1ObjectId fromString: '1.2.840.113549.1.7.1'));
		yourself.
	signerInfo signedAttrs add: attr.
	attr := CMSAttribute new
		attrType: (ASN1ObjectId fromString: '1.2.840.113549.1.9.5');
		attrValues: (Set with: DateAndTime now);
		yourself.
	signerInfo signedAttrs add: attr.
	attr := CMSAttribute new
		attrType: (ASN1ObjectId fromString: '1.2.840.113549.1.9.4');
		attrValues: (Set with: textDigest);
		yourself.
	signerInfo signedAttrs add: attr.
	attr := CMSAttribute new
		attrType: (ASN1ObjectId fromString: '1.3.6.1.4.1.311.16.4');
		attrValues: (Set with: (ASN1Stream decodeBytes: (ASN1Stream 
			encode: signerInfo sid 
			withType: ((ASN1Module name: #cms) find: #SignerIdentifier))));
		yourself.
	signerInfo signedAttrs add: attr.
	attr := CMSAttribute new
		attrType: (ASN1ObjectId fromString: '1.2.840.113549.1.9.16.2.11');
		attrValues: (Set with: (ASN1ExplicitContextValue new
			tagIndex: 0;
			tagValue: (ASN1Stream decodeBytes: (ASN1Stream 
				encode: signerInfo sid 
				withType: ((ASN1Module name: #cms) find: #SignerIdentifier)));
			tagIsPrimitive: false;
			yourself));
		yourself.
	signerInfo signedAttrs add: attr.
	signerInfo signatureAlgorithm: (X509AlgorithmIdentifier oidString: '1.2.840.113549.1.1.1' parameters: ASN1Null new).

	"Compute the Signature"
	signedAttrsDer := (ASN1Stream 
		encode: signerInfo signedAttrs
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
	signerInfo signature: (self certStore ownerPrivateKey v15SignMessageHash: signedDigest).

	signedData := CMSSignedData new.
	signedData version: 1.
	signedData digestAlgorithms: (Set with: (X509AlgorithmIdentifier oidString: '1.3.14.3.2.26' parameters: ASN1Null new)).
	signedData encapContentInfo: (CMSEncapsulatedContentInfo new
		eContentType: (ASN1ObjectId fromString: '1.2.840.113549.1.7.1');
		yourself).
	signedData certificates: (OrderedSet withAll: self certStore ownerCerts).
	signedData signerInfos: (Set with: signerInfo).

	contentInfo := CMSContentInfo new
		contentType: (ASN1ObjectId fromString: '1.2.840.113549.1.7.2');
		content: signedData;
		yourself.
	^ contentInfo