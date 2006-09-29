field definition
fields
	"Win32FFICertInfoStruct defineFields
	typedef struct _CERT_INFO {  
		DWORD dwVersion;  
		CRYPT_INTEGER_BLOB SerialNumber;  
		CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;  
		CERT_NAME_BLOB Issuer;  
		FILETIME NotBefore;  
		FILETIME NotAfter;  
		CERT_NAME_BLOB Subject;  
		CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo;  
		CRYPT_BIT_BLOB IssuerUniqueId;  
		CRYPT_BIT_BLOB SubjectUniqueId;  
		DWORD cExtension;  
		PCERT_EXTENSION rgExtension;
} CERT_INFO,  *PCERT_INFO;"

	^#(
		(dwVersion	'ulong')
		(serialNumber 'Win32FFICryptoApiBlobStruct')
		(signatureAlgorithm 'Win32FFICryptAlgorithmIdentifierStruct')
		(issuer	'Win32FFICryptoApiBlobStruct')
		(notBefore 'Win32FFIFileTimeStruct*')
		(notAfter	'Win32FFIFileTimeStruct*')
		(subject		'Win32FFICryptoApiBlobStruct*')
		(subjectPublicKeyInfo 'Win32FFICertPublicKeyInfoStruct*')
		(issuerUniqueId	'Win32FFICryptBitBlobStruct*')
		(subjectUniqueId 'Win32FFICryptBitBlobStruct*')
		(cExtension	'ulong')
		(rgExtension 'Win32FFICertExtensionStruct*')
	   )