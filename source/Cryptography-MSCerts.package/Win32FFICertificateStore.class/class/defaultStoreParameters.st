instance creation
defaultStoreParameters
	"default storeParameters needed to open the certificate store"
	"the first parameter 9 sets the system store using 10 will require that the store name 'MY' be sent as a wide string.  To send 'MY' as a wide string you could use COMWideString fromString: 'MY' a ByteArray(77 0 89 0).  see Torsen's COM on www.squeaksource.com. then send in the byteArray.  Or simply hard code the byte array."
	"hCertStore = CertOpenStore(
	CERT_STORE_PROV_SYSTEM_A, // System store will be a 
		// virtual store
	0,      // Encoding type not needed 
	         // with this PROV
	NULL,  // Accept the default HCRYPTPROV
	CERT_SYSTEM_STORE_CURRENT_USER,   65536
		// Set the system store location in the
		// registry
	""MY""))  // Could have used other predefined 
	
	#define CERT_SYSTEM_STORE_LOCAL_MACHINE         \
    (CERT_SYSTEM_STORE_LOCAL_MACHINE_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT)
	#define CERT_SYSTEM_STORE_LOCAL_MACHINE_ID      2
	#define CERT_SYSTEM_STORE_LOCATION_SHIFT        16
	(2 bitShift: 16 = 131072) 
	"
	
	^#(9 0 nil 131072 'MY')