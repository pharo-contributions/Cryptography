primitives
firstCertificateInStore: aHandle certContext: aCertContext

	"CertEnumCertificatesInStore(
     hCertStore,
     pCertContext)"

	<apicall: Win32FFICertContextStruct * 'CertEnumCertificatesInStore' (long long) module: 'crypt32.dll'>
	^self externalCallFailed