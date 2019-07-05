Class {
	#name : #X509Certificate,
	#superclass : #Object,
	#instVars : [
		'tbsCertificate',
		'signatureAlgorithm',
		'signature'
	],
	#category : 'X509'
}

{ #category : #'instance creation' }
X509Certificate class >> fromBytes: bytes [

	| type |
	type := (ASN1Module name: #x509) find: #Certificate.
	^ ASN1Stream decodeBytes: bytes withType: type.

]

{ #category : #'instance creation' }
X509Certificate class >> fromFile: filename [

	| fs data i j |
	fs := StandardFileStream readOnlyFileNamed: filename.
	data := fs contentsOfEntireFile.
	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.
	i = 0 ifTrue: [^ self fromBytes: data asByteArray].
	i := data indexOfSubCollection: 'CERTIFICATE--' startingAt: i.
	j := data indexOfSubCollection: '--END ' startingAt: i.
	i := data findAnySubStr: String crlf startingAt: i.
	data := (data copyFrom: i to: j)
		reject: [:c | (c = $-) or: [c isSeparator]].
	data := (Base64MimeConverter mimeDecodeToBytes: data readStream) contents.
	^ self fromBytes: data.

]

{ #category : #'class initialization' }
X509Certificate class >> initialize [

	self initializeASN1Types.

]

{ #category : #'class initialization' }
X509Certificate class >> initializeASN1Types [

	((ASN1Module name: #x509) sequence: #Certificate mapping: X509Certificate)
		add: #tbsCertificate type: #TBSCertificate;
		add: #signatureAlgorithm type: #AlgorithmIdentifier;
		add: #signature type: #ASN1BitStringType;
		yourself.
	(ASN1Module name: #x509) find: #Certificate.

	((ASN1Module name: #x509) sequence: #TBSCertificate mapping: X509TBSCertificate)
		add: #version type: #Version explicitTag: 0 default: 0;
		add: #serialNumber type: #CertificateSerialNumber;
		add: #signature type: #AlgorithmIdentifier;
		add: #issuer type: #Name;
		add: #validity type: #Validity;
		add: #subject type: #Name;
		add: #subjectPublicKeyInfo type: #SubjectPublicKeyInfo;
		addOptional: #issuerUniqueID type: #UniqueIdentifier implicitTag: 1;
		addOptional: #subjectUniqueID type: #UniqueIdentifier implicitTag: 2;
		addOptional: #extensions type: #Extensions explicitTag: 3;
		yourself.

	((ASN1Module name: #x509) sequence: #AlgorithmIdentifier mapping: X509AlgorithmIdentifier)
		add: #oid type: #ASN1ObjectIdentifierType;
		addOptional: #parameters type: #ASN1AnyType;
		yourself.

	(ASN1Module name: #x509) integer: #Version.
	(ASN1Module name: #x509) integer: #CertificateSerialNumber.
	(ASN1Module name: #x509) bitString: #UniqueIdentifier.
	(ASN1Module name: #x509) sequence: #Extensions of: #Extension.

	((ASN1Module name: #x509) sequence: #SubjectPublicKeyInfo mapping: X509SubjectPublicKeyInfo)
		add: #algorithm type: #AlgorithmIdentifier;
		add: #subjectPublicKey type: #ASN1BitStringType;
		yourself.

	((ASN1Module name: #x509) sequence: #Validity mapping: X509Validity)
		add: #notBefore type: #Time;
		add: #notAfter type: #Time;
		yourself.
	(ASN1Module name: #x509) utcTime: #Time.

	((ASN1Module name: #x509) choice: #Name)
		add: #names type: #RDNSequence.
	(ASN1Module name: #x509) sequence: #RDNSequence of: #RelativeDistinguishedName.
	(ASN1Module name: #x509) set: #RelativeDistinguishedName of: #AttributeTypeAndValue.

	((ASN1Module name: #x509) sequence: #Extension mapping: X509CertificateExtension)
		add: #extnId type: #ASN1ObjectIdentifierType;
		addOptional: #extnCritical type: #ASN1BooleanType default: false;
		add: #extnValue type: #ASN1ByteArrayType;
		yourself.

	((ASN1Module name: #x509) sequence: #AttributeTypeAndValue mapping: X520Attribute)
		add: #attrOid type: #AttributeType;
		add: #attrValue type: #AttributeValue;
		yourself.
	(ASN1Module name: #x509) objectIdentifier: #AttributeType.
	((ASN1Module name: #x509) any: #AttributeValue definedBy: #attrOid)
		at: (ASN1ObjectId fromString: '2.5.4.41') put: #X520Name;
		at: (ASN1ObjectId fromString: '2.5.4.4') put: #X520Name;
		at: (ASN1ObjectId fromString: '2.5.4.42') put: #X520Name;
		at: (ASN1ObjectId fromString: '2.5.4.43') put: #X520Name;
		at: (ASN1ObjectId fromString: '2.5.4.44') put: #X520Name;
		at: (ASN1ObjectId fromString: '2.5.4.3') put: #X520CommonName;
		at: (ASN1ObjectId fromString: '2.5.4.7') put: #X520LocalityName;
		at: (ASN1ObjectId fromString: '2.5.4.8') put: #X520StateOrProvinceName;
		at: (ASN1ObjectId fromString: '2.5.4.10') put: #X520OrganizationName;
		at: (ASN1ObjectId fromString: '2.5.4.11') put: #X520OrganizationalUnitName;
		at: (ASN1ObjectId fromString: '2.5.4.6') put: #X520CountryName;
		at: (ASN1ObjectId fromString: '1.2.840.113549.1.9.1') put: #X520Pkcs9EmailAddress;
		defaultType: #X509StringChoice;
		yourself.
	((ASN1Module name: #x509) choice: #X509StringChoice)
		add: #teletexString type: #ASN1TeletexStringType;
		add: #printableString type: #ASN1PrintableStringType;
		add: #universalString type: #ASN1UniversalStringType;
		add: #utf8String type: #ASN1StringType;
		add: #bmpString type: #ASN1BMPStringType;
		yourself.
	((ASN1Module name: #x509) mapped: #X520Name)
		mapping: X520Name mappingSymbol: #string type: #X509StringChoice.
	((ASN1Module name: #x509) mapped: #X520CommonName)
		mapping: X520CommonName mappingSymbol: #string type: #X509StringChoice.
	((ASN1Module name: #x509) mapped: #X520LocalityName)
		mapping: X520LocalityName mappingSymbol: #string type: #X509StringChoice.
	((ASN1Module name: #x509) mapped: #X520StateOrProvinceName)
		mapping: X520StateOrProvinceName mappingSymbol: #string type: #X509StringChoice.
	((ASN1Module name: #x509) mapped: #X520OrganizationName)
		mapping: X520OrganizationName mappingSymbol: #string type: #X509StringChoice.
	((ASN1Module name: #x509) mapped: #X520OrganizationalUnitName)
		mapping: X520OrganizationalUnitName mappingSymbol: #string type: #X509StringChoice.
	((ASN1Module name: #x509) mapped: #X520CountryName)
		mapping: X520CountryName mappingSymbol: #string type: #ASN1PrintableStringType.
	((ASN1Module name: #x509) mapped: #X520Pkcs9EmailAddress)
		mapping: X520Pkcs9EmailAddress mappingSymbol: #string type: #ASN1IA5StringType.
	

]

{ #category : #converting }
X509Certificate >> asAsn1Bytes [

	| type |
	type := (ASN1Module name: #x509) find: #Certificate.
	^ ASN1Stream encode: self withType: type

]

{ #category : #converting }
X509Certificate >> asDerCertificateList [

	^ (OrderedCollection with: self) asAsn1Bytes

]

{ #category : #accessing }
X509Certificate >> signature [
	"Answer the value of signature"

	^ signature
]

{ #category : #accessing }
X509Certificate >> signature: anObject [
	"Set the value of signature"

	signature := anObject
]

{ #category : #accessing }
X509Certificate >> signatureAlgorithm [
	"Answer the value of signatureAlgorithm"

	^ signatureAlgorithm
]

{ #category : #accessing }
X509Certificate >> signatureAlgorithm: anObject [
	"Set the value of signatureAlgorithm"

	signatureAlgorithm := anObject
]

{ #category : #accessing }
X509Certificate >> tbsCertificate [
	"Answer the value of tbsCertificate"

	^ tbsCertificate
]

{ #category : #accessing }
X509Certificate >> tbsCertificate: anObject [
	"Set the value of tbsCertificate"

	tbsCertificate := anObject
]

{ #category : #verifying }
X509Certificate >> verifyFromParentCertificate: parentCert [

	(DateAndTime now 
		between: self tbsCertificate validity notBefore
		and: self tbsCertificate validity notAfter)
			ifFalse: [^ false].
	self tbsCertificate issuer = parentCert tbsCertificate subject
		ifFalse: [^ false].
	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.2')
		ifTrue: [^ self verifyMD2WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.4')
		ifTrue: [^ self verifyMD5WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.113549.1.1.5')
		ifTrue: [^ self verifySHA1WithRSAEncryptionFromParentCertificate: parentCert].
	(self tbsCertificate signature oid oid = '1.2.840.10040.4.3')
		ifTrue: [^ self verifySHA1WithDSAEncryptionFromParentCertificate: parentCert].
	^ false.

]

{ #category : #verifying }
X509Certificate >> verifyMD2WithRSAEncryptionFromParentCertificate: parentCert [

	| publicKey hash msg |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.

	hash := MD2 hashMessage: self tbsCertificate asAsn1Bytes.
	msg := OrderedCollection new
		add: (OrderedCollection new add: (ASN1ObjectId fromString: '1.2.840.113549.2.2'); add: nil; yourself);
		add: hash;
		asAsn1Bytes.
	^ publicKey v15VerifySignature: self signature bytes ofMessageHash: msg.

]

{ #category : #verifying }
X509Certificate >> verifyMD5WithRSAEncryptionFromParentCertificate: parentCert [

	| publicKey hash msg |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.
	hash := MD5 hashMessage: self tbsCertificate asAsn1Bytes.
	msg := OrderedCollection new
		add: (OrderedCollection new add: (ASN1ObjectId fromString: '1.2.840.113549.2.5'); add: nil; yourself);
		add: hash;
		asAsn1Bytes.
	^ publicKey v15VerifySignature: self signature bytes ofMessageHash: msg.

]

{ #category : #verifying }
X509Certificate >> verifySHA1WithDSAEncryptionFromParentCertificate: parentCert [

	| publicKey sig toBeSigned |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.
	sig := ASN1Stream decodeBytes: self signature bytes.
	toBeSigned := SHA1 hashMessage: self tbsCertificate asAsn1Bytes.
	^ publicKey verifySignature: sig ofMessageHash: toBeSigned.

]

{ #category : #verifying }
X509Certificate >> verifySHA1WithRSAEncryptionFromParentCertificate: parentCert [

	| publicKey hash msg |
	publicKey := parentCert tbsCertificate subjectPublicKeyInfo asPublicKey.

	hash := SHA1 hashMessage: self tbsCertificate asAsn1Bytes.
	msg := OrderedCollection new
		add: (OrderedCollection new add: (ASN1ObjectId fromString: '1.3.14.3.2.26'); add: nil; yourself);
		add: hash;
		asAsn1Bytes.
	^ publicKey v15VerifySignature: self signature bytes ofMessageHash: msg.

]
