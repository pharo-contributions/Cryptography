primitives
freeCertContext: aCertContext

	<apicall: void 'CertFreeCertificateContext' (Win32FFICertContextStruct *) module: 'crypt32.dll'>
	^self externalCallFailed