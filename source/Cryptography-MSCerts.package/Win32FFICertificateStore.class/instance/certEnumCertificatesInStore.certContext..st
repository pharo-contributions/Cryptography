primitives
certEnumCertificatesInStore: aHandle certContext: aCertContext

	"CertEnumCertificatesInStore(
     hCertStore,
     pCertContext)"

	<apicall: Win32FFICertContextStruct 'CertEnumCertificatesInStore' (long Win32FFICertContextStruct *) module: 'crypt32.dll'>
	^self externalCallFailed