reading/writing
loadPkcs12PrivateKeyFile: filename

	| keyFileReader |
	keyFileReader := Pkcs12PrivateKeyFileReader 
		fromFile: filename 
		password: (FillInTheBlank requestPassword: 'Enter the pkcs12 password:').
	self ownerPrivateKey: keyFileReader asPrivateKey.
	self ownerCerts: keyFileReader certs.
