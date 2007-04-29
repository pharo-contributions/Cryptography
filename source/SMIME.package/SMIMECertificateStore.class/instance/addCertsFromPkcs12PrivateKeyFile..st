reading/writing
addCertsFromPkcs12PrivateKeyFile: filename

	| keyFileReader |
	keyFileReader := Pkcs12PrivateKeyFileReader 
		fromFile: filename 
		password: (FillInTheBlank requestPassword: 'Enter the pkcs12 password:').
	self ownerCerts addAll: keyFileReader certs.
	self writeStoreData.
