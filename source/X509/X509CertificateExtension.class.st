Class {
	#name : #X509CertificateExtension,
	#superclass : #Object,
	#instVars : [
		'extnId',
		'extnCritical',
		'extnValue',
		'decodedExtension'
	],
	#category : 'X509-Extensions'
}

{ #category : #'class initialization' }
X509CertificateExtension class >> initialize [

	self initializeASN1Types.

]

{ #category : #'class initialization' }
X509CertificateExtension class >> initializeASN1Types [

	((ASN1Module name: #x509) sequence: #AuthorityKeyIdentifier mapping: X509AuthorityKeyIdentifier)
		addOptional: #keyIdentifier type: #KeyIdentifier implicitTag: 0;
		addOptional: #certIssuer type: #GeneralNames implicitTag: 1;
		addOptional: #certSerialNumber type: #CertificateSerialNumber implicitTag: 2;
		yourself.
	(ASN1Module name: #x509) byteArray: #KeyIdentifier.

	(ASN1Module name: #x509) sequence: #GeneralNames of: #GeneralName.
	((ASN1Module name: #x509) choice: #GeneralName)
		add: #otherName type: #AnotherName implicitTag: 0;
		add: #rfc822Name type: #ASN1IA5StringType implicitTag: 1;
		add: #dNSName type: #ASN1IA5StringType implicitTag: 2;
"		add: #x400Address type: #ORAddress implicitTag: 3;"
		add: #directoryName type: #Name explicitTag: 4;
		add: #ediPartyName type: #EDIPartyName implicitTag: 5;
		add: #uniformResourceIdenifier type: #ASN1IA5StringType implicitTag: 6;
		add: #iPAddress type: #ASN1ByteArrayType implicitTag: 7;
		add: #registeredID type: #ASN1ObjectIdentifierType implicitTag: 8;
		yourself.
	((ASN1Module name: #x509) sequence: #AnotherName mapping: X509AnotherName)
		add: #typeId type: #ASN1ObjectIdentifierType;
		add: #value type: #ASN1AnyType explicitTag: 0;
		yourself.
	((ASN1Module name: #x509) sequence: #EDIPartyName mapping: X509EDIPartyName)
		addOptional: #nameAssigner type: #X509StringChoice implicitTag: 0;
		add: #partyName type: #X509StringChoice implicitTag: 1;
		yourself.

	(ASN1Module name: #x509) bitString: #KeyUsage.

	((ASN1Module name: #x509) sequence: #PrivateKeyUsagePeriod mapping: X509Validity)
		addOptional: #notBefore type: #ASN1UTCTimeType implicitTag: 0;
		addOptional: #notAfter type: #ASN1UTCTimeType implicitTag: 1;
		yourself.

	(ASN1Module name: #x509) sequence: #CertificatePolicies of: #PolicyInformation.
	((ASN1Module name: #x509) sequence: #PolicyInformation mapping: X509PolicyInformation)
		add: #id type: #CertPolicyId;
		addOptional: #qualifiers type: #PolicyQualifierInfos;
		yourself.
	(ASN1Module name: #x509) objectIdentifier: #CertPolicyId.
	(ASN1Module name: #x509) sequence: #PolicyQualifierInfos of: #PolicyQualifierInfo.
	((ASN1Module name: #x509) sequence: #PolicyQualifierInfo mapping: X509PolicyQualifierInfo)
		add: #id type: #ASN1ObjectIdentifierType;
		add: #qualifier type: #ASN1AnyType;
		yourself.

	(ASN1Module name: #x509) sequence: #PolicyMappings of: #PolicyMapping.
	((ASN1Module name: #x509) sequence: #PolicyMapping mapping: X509PolicyMapping)
		add: #issuerDomainPolicy type: #CertPolicyId;
		add: #subjectDomainPolicy type: #CertPolicyId;
		yourself.

	(ASN1Module name: #x509) assign: #SubjectAltName from: #GeneralNames.
	(ASN1Module name: #x509) assign: #IssuerAltName from: #GeneralNames.

	(ASN1Module name: #x509) sequence: #SubjectDirectoryAttributes of: #Attribute.

	((ASN1Module name: #x509) sequence: #BasicConstraints mapping: X509BasicConstraints)
		add: #ca type: #ASN1BooleanType default: false;
		addOptional: #pathLengthConstraint type: #ASN1IntegerType;
		yourself.

	((ASN1Module name: #x509) sequence: #NameConstraints mapping: X509NameConstraints)
		addOptional: #permittedSubtrees type: #GeneralSubtrees implicitTag: 0;
		addOptional: #excludedSubtrees type: #GeneralSubtrees implicitTag: 1;
		yourself.
	(ASN1Module name: #x509) sequence: #GeneralSubtrees of: #GeneralSubtree.
	((ASN1Module name: #x509) sequence: #GeneralSubtree mapping: X509GeneralSubtree)
		add: #base type: #GeneralName;
		add: #minimum type: #BaseDistance implicitTag: 0 default: 0;
		addOptional: #maximum type: #BaseDistance implicitTag: 1;
		yourself.
	(ASN1Module name: #x509) integer: #BaseDistance.

	((ASN1Module name: #x509) sequence: #PolicyConstraints mapping: X509PolicyConstraints)
		addOptional: #requireExplicitPolicy type: #SkipCerts implicitTag: 0;
		addOptional: #inhibitPolicyMapping type: #SkipCerts implicitTag: 1;
		yourself.
	(ASN1Module name: #x509) integer: #SkipCerts.

	(ASN1Module name: #x509) sequence: #CRLDistributionPoints of: #DistributionPoint.
	((ASN1Module name: #x509) sequence: #DistributionPoint mapping: X509DistributionPoint)
		addOptional: #distributionPoint type: #DistributionPointName explicitTag: 0;
		addOptional: #reasons type: #ReasonFlags implicitTag: 1;
		addOptional: #cRLIssuer type: #GeneralNames implicitTag: 2;
		yourself.
	((ASN1Module name: #x509) choice: #DistributionPointName)
		add: #fullName type: #GeneralNames implicitTag: 0;
		add: #nameRelativeToCRLIssuer type: #RelativeDistinguishedName implicitTag: 1;
		yourself.
	(ASN1Module name: #x509) bitString: #ReasonFlags.

	(ASN1Module name: #x509) sequence: #ExtKeyUsageSyntax of: #KeyPurposeId.
	(ASN1Module name: #x509) objectIdentifier: #KeyPurposeId.

	(ASN1Module name: #x509) assign: #InhibitAnyPolicy from: #SkipCerts.

	(ASN1Module name: #x509) assign: #FreshestCRL from: #CRLDistributionPoints.

	(ASN1Module name: #x509) sequence: #AuthorityInfoAccessSyntax of: #AccessDescription.
	((ASN1Module name: #x509) sequence: #AccessDescription mapping: X509AccessDescription)
		add: #accessMethod type: #ASN1ObjectIdentifierType;
		add: #accessLocation type: #GeneralName;
		yourself.

	(ASN1Module name: #x509) sequence: #SubjectInfoAccessSyntax of: #AccessDescription.

	(ASN1Module name: #x509) integer: #CRLNumber.

	((ASN1Module name: #x509) sequence: #IssuingDistributionPoint mapping: X509IssuingDistributionPoint)
		addOptional: #distributionPoint type: #DistributionPointName explicitTag: 0;
		add: #onlyContainsUserCerts type: #ASN1BooleanType implicitTag: 1 default: false;
		add: #onlyContainsCACerts type: #ASN1BooleanType implicitTag: 2 default: false;
		addOptional: #onlySomeReasons type: #ReasonFlags implicitTag: 3;
		add: #indirectCRL type: #ASN1BooleanType implicitTag: 4 default: false;
		add: #onlyContainsAttributeCerts type: #ASN1BooleanType implicitTag: 5 default: false;
		yourself.

	(ASN1Module name: #x509) assign: #BaseCRLNumber from: #CRLNumber.

"	(ASN1Module name: #x509) enumerated: #CRLReason."

	(ASN1Module name: #x509) assign: #CertificateIssuer from: #GeneralNames.

	(ASN1Module name: #x509) objectIdentifier: #HoldInstructionCode.

	(ASN1Module name: #x509) utcTime: #InvalidityDate.

]

{ #category : #'class initialization' }
X509CertificateExtension class >> objectIdToTypeSymbolMap [

	| map |
	map := Dictionary new
		at: (ASN1ObjectId fromString: '2.5.29.35') put: #AuthorityKeyIdentifier;
		at: (ASN1ObjectId fromString: '2.5.29.14') put: #KeyIdentifier;
		at: (ASN1ObjectId fromString: '2.5.29.15') put: #KeyUsage;
		at: (ASN1ObjectId fromString: '2.5.29.16') put: #PrivateKeyUsagePeriod;
		at: (ASN1ObjectId fromString: '2.5.29.32') put: #CertificatePolicies;
		at: (ASN1ObjectId fromString: '2.5.29.33') put: #PolicyMappings;
		at: (ASN1ObjectId fromString: '2.5.29.17') put: #SubjectAltName;
		at: (ASN1ObjectId fromString: '2.5.29.18') put: #IssuerAltName;
		at: (ASN1ObjectId fromString: '2.5.29.9') put: #SubjectDirectoryAttributes;
		at: (ASN1ObjectId fromString: '2.5.29.19') put: #BasicConstraints;
		at: (ASN1ObjectId fromString: '2.5.29.30') put: #NameConstraints;
		at: (ASN1ObjectId fromString: '2.5.29.36') put: #PolicyConstraints;
		at: (ASN1ObjectId fromString: '2.5.29.31') put: #CRLDistributionPoints;
		at: (ASN1ObjectId fromString: '2.5.29.37') put: #ExtKeyUsageSyntax;
		at: (ASN1ObjectId fromString: '2.5.29.54') put: #InhibitAnyPolicy;
		at: (ASN1ObjectId fromString: '2.5.29.46') put: #FreshestCRL;
		at: (ASN1ObjectId fromString: '1.3.6.1.5.5.7.1.1') put: #AuthorityInfoAccessSyntax;
		at: (ASN1ObjectId fromString: '1.3.6.1.5.5.7.1.11') put: #SubjectInfoAccessSyntax;
		at: (ASN1ObjectId fromString: '2.5.29.20') put: #CRLNumber;
		at: (ASN1ObjectId fromString: '2.5.29.28') put: #IssuingDistributionPoint;
		at: (ASN1ObjectId fromString: '2.5.29.27') put: #BaseCRLNumber;
		at: (ASN1ObjectId fromString: '2.5.29.21') put: #CRLReason;
		at: (ASN1ObjectId fromString: '2.5.29.29') put: #CertificateIssuer;
		at: (ASN1ObjectId fromString: '2.5.29.23') put: #HoldInstructionCode;
		at: (ASN1ObjectId fromString: '2.5.29.24') put: #InvalidityDate;
		yourself.
	^ map
]

{ #category : #private }
X509CertificateExtension >> asn1TypeForExtension [
	"
		id-ce = 2.5.29
		id-pe = 1.3.6.1.5.5.7.1
		id-qt = 1.3.6.1.5.5.7.2
		id-kp = 1.3.6.1.5.5.7.3
		id-ad = 1.3.6.1.5.5.7.48
	"
	
	| typeSymbol |
	typeSymbol := self class objectIdToTypeSymbolMap at: self extnId ifAbsent: [^nil].
	^ (ASN1Module name: #x509) find: typeSymbol.
	
]

{ #category : #private }
X509CertificateExtension >> decodeExtension [

	| type ext |
	type := self asn1TypeForExtension.
	ext := [ASN1Stream decodeBytes: self extnValue withType: type]
		on: Error
		do: [:ex | ASN1Stream decodeBytes: self extnValue].
	self decodedExtension: ext.

]

{ #category : #accessing }
X509CertificateExtension >> decodedExtension [
	"Answer the value of decodedExtension"

	^ decodedExtension
]

{ #category : #accessing }
X509CertificateExtension >> decodedExtension: anObject [
	"Set the value of decodedExtension"

	decodedExtension := anObject
]

{ #category : #accessing }
X509CertificateExtension >> extnCritical [
	"Answer the value of extnCritical"

	^ extnCritical
]

{ #category : #accessing }
X509CertificateExtension >> extnCritical: anObject [
	"Set the value of extnCritical"

	extnCritical := anObject
]

{ #category : #accessing }
X509CertificateExtension >> extnId [
	"Answer the value of extnId"

	^ extnId
]

{ #category : #accessing }
X509CertificateExtension >> extnId: anObject [
	"Set the value of extnId"

	extnId := anObject
]

{ #category : #accessing }
X509CertificateExtension >> extnValue [
	"Answer the value of extnValue"

	^ extnValue
]

{ #category : #accessing }
X509CertificateExtension >> extnValue: anObject [
	"Set the value of extnValue"

	extnValue := anObject.
	self decodeExtension.
]
