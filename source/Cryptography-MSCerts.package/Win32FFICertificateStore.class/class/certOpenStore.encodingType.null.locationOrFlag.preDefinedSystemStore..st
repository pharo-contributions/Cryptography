primitives
certOpenStore: aStoreProvider encodingType: aType null: aNull locationOrFlag: aLocOrFlag preDefinedSystemStore: aLocation
	"CERT_STORE_PROV_SYSTEM, // System store will be a   = 10
		// virtual store
	0,
		// Encoding type not needed 
	
		// with this PROV
	NULL,  // Accept the default HCRYPTPROV
	CERT_SYSTEM_STORE_CURRENT_USER,  = 65536
		// Set the system store location in the
		// registry
	L""MY"")
	HCERTSTORE WINAPI CertOpenStore(
LPCSTR lpszStoreProvider,
DWORD dwMsgAndCertEncodingType,
HCRYPTPROV_LEGACY hCryptProv,
DWORD dwFlags,
const void* pvPara
	);

	"
	<apicall: long 'CertOpenStore' (ulong long long long char*) module:'crypt32.dll'>
	^self externalCallFailed
