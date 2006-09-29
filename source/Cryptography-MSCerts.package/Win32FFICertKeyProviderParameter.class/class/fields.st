field definition
fields

	"Win32FFICertKeyProviderParameter defineFields"
	"typedef struct _CRYPT_KEY_PROV_PARAM {
    DWORD           dwParam;
    BYTE            *pbData;
    DWORD           cbData;
    DWORD           dwFlags;
} CRYPT_KEY_PROV_PARAM, *PCRYPT_KEY_PROV_PARAM;"
	
	^#(
		(dwParam	'long')
		(pbData		'byte *')
		(cbData		'long')
		(dwFlags	'long')
	   )