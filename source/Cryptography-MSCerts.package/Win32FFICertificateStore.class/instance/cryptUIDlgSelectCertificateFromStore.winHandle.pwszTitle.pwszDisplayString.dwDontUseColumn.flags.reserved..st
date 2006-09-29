primitives
cryptUIDlgSelectCertificateFromStore: aHandle winHandle: aWinHandle pwszTitle: aTitle pwszDisplayString: aDisplayString dwDontUseColumn: dnuColumn flags: flags reserved: aVoid
" PCCERT_CONTEXT WINAPI CryptUIDlgSelectCertificateFromStore(
  HCERTSTORE hCertStore,
  HWND hwnd,
  LPCWSTR pwszTitle,
  LPCWSTR pwszDisplayString,
  DWORD dwDontUseColumn,
  DWORD dwFlags,
  void* pvReserved
);
Parameters

hCertStore 
[in] Handle of the certificate store to be searched. 

hwnd 
[in] Handle of the window for the display. If NULL, defaults to the desktop window. 

pwszTitle 
[in, optional] String used as the title of the dialog box. If NULL, the default title, Select Certificate, is used. 

pwszDisplayString 
[in, optional] Text statement in the selection dialog box. If NULL, the default phrase, Select a certificate you wish to use 

dwDontUseColumn 
[in] Flags that can be combined to exclude columns of the display. Value Meaning 
CRYPTUI_SELECT_ISSUEDTO_COLUMN Do not display the ISSUEDTO information. 
CRYPTUI_SELECT_ISSUEDBY_COLUMN Do not display the ISSUEDBY information. 
CRYPTUI_SELECT_INTENDEDUSE_COLUMN Do not display IntendedUse information. 
CRYPTUI_SELECT_FRIENDLYNAME_COLUMN Do not display the friendly name information. 
CRYPTUI_SELECT_LOCATION_COLUMN Do not display location information. 
CRYPTUI_SELECT_EXPIRATION_COLUMN Do not display expiration information. 

dwFlags 
[in] Currently not used and should be set to 0. 
pvReserved 
[in] Reserved for future use. 
pCertContext = CryptUIDlgSelectCertificateFromStore(
hCertStore,
NULL,
NULL,
NULL,
CRYPTUI_SELECT_LOCATION_COLUMN,
0,
NULL))"


	<apicall: Win32FFICertContextStruct * 'CryptUIDlgSelectCertificateFromStore' (long long char* char* long long long) module: 'cryptui.dll'>
	^self externalCallFailed