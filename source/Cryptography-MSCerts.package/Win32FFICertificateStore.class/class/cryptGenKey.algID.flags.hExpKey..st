primitives
cryptGenKey: aProviderHandle algID: anAlgID flags: dwFlags hExpKey: aBuffer

"
BOOL WINAPI CryptGenKey(
  HCRYPTPROV hProv,
  ALG_ID Algid,
  DWORD dwFlags,
  HCRYPTKEY* phKey
);

CryptGenKey(hProvider, AT_KEYEXCHANGE, (1024 << 16), &hExpKey)

"

	<apicall: bool 'CryptGenKey' (long long long long) module: 'Advapi32.dll'>
	^self externalCallFailed