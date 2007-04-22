initialize-release
initialize

	(FileStream isAFileNamed: self certStoreFilename)
		ifFalse: [
			(FileDirectory default directoryExists: 'certificates')
				ifFalse: [FileDirectory default createDirectory: 'certificates'].
			((FileDirectory default directoryNamed: 'certificates') directoryExists: 'roots')
				ifFalse: [(FileDirectory default directoryNamed: 'certificates') createDirectory: 'roots'].
			self storeData: SMIMECertificateStoreData new.
			self writeStoreData].
	self readStoreData.
	self rootCertificates: OrderedCollection new.
	self loadRootCertificates.
