primitives
cryptGetUserKey: aCryptProvider keyType: aKeyType handleBuffer: aBuffer
	"call to set aBuffer with the handle to the selected certificate, AT_KEYEXCHANGE means that the certificate can be used for more then just a signature.  AT_SIGNATURE is the certificate that is used only for signatures.  Systems really should have one certificate for signing and one for encryption
	
	 #define AT_KEYEXCHANGE          1
      #define AT_SIGNATURE             2 "
	
	<apicall: bool 'CryptGetUserKey' (long long long) module: 'Advapi32.dll'>    
	^self externalCallFailed

	