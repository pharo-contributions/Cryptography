other
loadSMIMEOwnerCert

	| fileResult fileName |
	(fileResult := FileList2 modalFileSelector)
		ifNotNil: [
			fileName := fileResult directory fullNameFor: fileResult name.
			self smimeAgent certStore loadPkcs12PrivateKeyFile: fileName].
