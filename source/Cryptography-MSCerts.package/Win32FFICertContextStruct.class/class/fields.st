field definition
fields
	"Win32FFICertContextStruct defineFields
	
	typedef struct _CERT_CONTEXT {
    DWORD                   dwCertEncodingType;
    BYTE                    *pbCertEncoded;
    DWORD                   cbCertEncoded;
    PCERT_INFO              pCertInfo;
    HCERTSTORE              hCertStore;
} CERT_CONTEXT, *PCERT_CONTEXT;
Members
dwCertEncodingType 
Type of encoding used. It is always acceptable to specify both the certificate and message encoding types by combining them with a bitwise-OR operation as shown in the following example:
X509_ASN_ENCODING | PKCS_7_ASN_ENCODING 

Currently defined encoding types are:

X509_ASN_ENCODING 
PKCS_7_ASN_ENCODING 
pbCertEncoded 
Pointer to the encoded certificate. 
cbCertEncoded 
Size, in bytes, of the encoded certificate. 
pCertInfo 
Pointer to a structure of certificate information. 
hCertStore 
Handle to the certificate store that contains the certificate context. 
Requirements
"
	^#(
  		(dwCertEncodingType  'ulong') 
		(pbCertEncoded          'byte *')                  
    		(cbCertEncoded          'ulong')
    		(pCertInfo	             'Win32FFICertInfoStruct *')
   		(hStore				    'ulong') 
	)