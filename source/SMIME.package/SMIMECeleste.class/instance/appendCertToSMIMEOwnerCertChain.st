other
appendCertToSMIMEOwnerCertChain

	| fileResult fileName |
	(fileResult := FileList2 modalFileSelector)
		ifNotNil: [
			fileName := fileResult directory fullNameFor: fileResult name.
			self smimeAgent certStore addCertsFromPemFile: fileName].
