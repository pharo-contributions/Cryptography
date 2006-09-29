field definition
fields
	"Win32FFICertPublicKeyInfoStruct defineFields
	
typedef struct _CERT_PUBLIC_KEY_INFO {
    CRYPT_ALGORITHM_IDENTIFIER    Algorithm;
    CRYPT_BIT_BLOB                PublicKey;
} CERT_PUBLIC_KEY_INFO, *PCERT_PUBLIC_KEY_INFO;
	"
	^#(
		(algorithm	'Win32FFICryptAlgorithmIdentifierStruct*')
		(publicKey	'Win32FFICryptBitBlobStruct*')
	   )