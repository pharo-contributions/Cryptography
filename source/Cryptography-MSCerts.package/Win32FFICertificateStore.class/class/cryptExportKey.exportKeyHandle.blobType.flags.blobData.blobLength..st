primitives
cryptExportKey: aKeyHandle exportKeyHandle: hExpKey blobType: dwBlobType flags: dwFlags blobData: pbData blobLength: pdwbDataLen

"BOOL CRYPTFUNC CryptExportKey( 
  HCRYPTKEY hKey, 
  HCRYPTKEY hExpKey, 
  DWORD dwBlobType, 
  DWORD dwFlags, 
  BYTE* pbData, 
  DWORD* pdwbDataLen
);
http://windowssdk.msdn.microsoft.com/en-us/library/ms724048.aspx
dwBlobType 
[in] Specifies the type of key BLOB to be exported. The following table shows the possible values for this parameter. Constant Description 
	SIMPLEBLOB Used to transport session keys. 
	PLAINTEXTKEYBLOB Used to export any key supported by the CSP in use. The key is exported in plaintext. 
	PUBLICKEYBLOB  Used to transport public keys. 
	PRIVATEKEYBLOB  Used to transport public/private key pairs. 
	OPAQUEBLOB  Used to store session keys in a Schannel CSP. OPAQUEBLOBs are non-transferable and must be used within the CSP that generated the BLOB. 
	SYMMETRICWRAPKEYBLOB Used to export and import a symmetric key wrapped with another symmetric key. The actual wrapped key is in the format specified in the IETF SMIME X9.42 standard. 
	// exported key blob definitions
	#define SIMPLEBLOB              0x1
	#define PUBLICKEYBLOB           0x6
	#define PRIVATEKEYBLOB          0x7
	#define PLAINTEXTKEYBLOB        0x8
	#define OPAQUEKEYBLOB           0x9
	#define PUBLICKEYBLOBEX         0xA
	#define SYMMETRICWRAPKEYBLOB    0xB
	#define KEYSTATEBLOB            0xC
"

	<apicall: bool 'CryptExportKey' (long long long long long long) module: 'Advapi32.dll'>
	^self externalCallFailed