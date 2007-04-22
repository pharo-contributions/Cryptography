running
loadDSACertificateFile: certFile privateKeyFile: pkFile

	self certificateStore 
		loadDSACertificateFile: certFile
		privateKeyFile: pkFile
		password: nil.
