private
opaqueSignedContentInfoFrom: mailMsg

	| textDigest signerInfo digest contentInfo |
	contentInfo := CMSContentInfo new
		contentType: (ASN1ObjectId fromString: '1.2.840.113549.1.7.2');
		content: CMSSignedData new;
		yourself.
	contentInfo content version: 1.
	contentInfo content digestAlgorithms: (Set with: (X509AlgorithmIdentifier oidString: '1.3.14.3.2.26')).
	contentInfo content encapContentInfo: (CMSEncapsulatedContentInfo new
		eContentType: (ASN1ObjectId fromString: '1.2.840.113549.1.7.1');
		eContent: mailMsg text withInternetLineEndings asByteArray;
		yourself).
	contentInfo content certificates: (OrderedSet withAll: self certStore ownerCerts).

	textDigest := SHA1 hashMessage: contentInfo content encapContentInfo eContent.
	digest := OrderedCollection new
		add: (OrderedCollection new 
			add: (ASN1ObjectId fromString: '1.3.14.3.2.26'); 
			add: nil; 
			yourself);
		add: textDigest;
		asAsn1Bytes.

	signerInfo := CMSSignerInfo new.
	signerInfo version: 1.
	signerInfo sid: (CMSIssuerAndSerialNumber certificate: self certStore ownerCert).
	signerInfo digestAlgorithm: (X509AlgorithmIdentifier oidString: '1.3.14.3.2.26').
	signerInfo signatureAlgorithm: (X509AlgorithmIdentifier oidString: '1.2.840.113549.1.1.1').
	signerInfo signature: (self certStore ownerPrivateKey v15SignMessageHash: digest).

	contentInfo content signerInfos: (Set with: signerInfo).

	^ contentInfo