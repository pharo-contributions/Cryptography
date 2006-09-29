primitives
cryptAcquireContext: handleBuffer containerName: aContainerName providerName: aProviderName providerType: aProviderType null: aNil

	"
	BOOL WINAPI CryptAcquireContext(
  	HCRYPTPROV* phProv,
  	LPCTSTR pszContainer,
  	LPCTSTR pszProvider,
  	DWORD dwProvType,
  	DWORD dwFlags
	);
	
	return to the sender a handle to the cryptProvider this call needs to have strings that are wideStrings so you should use MSWideString atByteArray"

	<apicall: bool 'CryptAcquireContextW' (long char* char* long long) module: 'Advapi32.dll'>
	^self externalCallFailed
