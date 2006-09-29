field definition
fields
	"Win32FFICertExtensionStruct defineFields
	
typedef struct _CERT_EXTENSION {
    LPSTR               pszObjId;
    BOOL                fCritical;
    CRYPT_OBJID_BLOB    Value;
} CERT_EXTENSION, *PCERT_EXTENSION;
	"
	^#(
		(pszObjId	'char*')
		(fCritical	'bool')
		(value		'Win32FFICryptoApiBlobStruct*')
	   )