field definition
fields
	"Win32FFICryptAlgorithmIdentifierStruct defineFields
	
typedef struct _CRYPT_ALGORITHM_IDENTIFIER {
    LPSTR               pszObjId;
    CRYPT_OBJID_BLOB    Parameters;
} CRYPT_ALGORITHM_IDENTIFIER, *PCRYPT_ALGORITHM_IDENTIFIER;
	"
	^#(
		(pszObjId	'char *')
		(parameters	'Win32FFICryptoApiBlobStruct')
	   )