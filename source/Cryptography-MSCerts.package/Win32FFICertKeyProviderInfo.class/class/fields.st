field definition
fields
	"Win32FFICertKeyProviderInfo defineFields"
	"typedef struct _CRYPT_KEY_PROV_INFO {
    LPWSTR                  pwszContainerName;
    LPWSTR                  pwszProvName;
    DWORD                   dwProvType;
    DWORD                   dwFlags;
    DWORD                   cProvParam;
    PCRYPT_KEY_PROV_PARAM   rgProvParam;
    DWORD                   dwKeySpec;
} CRYPT_KEY_PROV_INFO, *PCRYPT_KEY_PROV_INFO;"

	^#(
		(pwszContainerName		'char *')
		(pwszProvName			'char *')
	     (dwProvType			'long')
		(dwFlags				'long')
		(cProvParam			'long')
		(rgProvParam			'Win32FFICertKeyProviderParameter')
		(dwKeySpec				'long')
	   )