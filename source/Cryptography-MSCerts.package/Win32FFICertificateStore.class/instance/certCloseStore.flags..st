primitives
certCloseStore: aHandle flags: aFlag
	"CertCloseStore(hCertStore,0)
	BOOL WINAPI CertCloseStore(
HCERTSTORE hCertStore,
DWORD dwFlags
);
	"
	<apicall: bool 'CertCloseStore' (long long) module:'crypt32.dll'>
	^self externalCallFailed
