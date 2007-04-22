as yet unclassified
testStore

	^ self new
		storeCertificate: self testCertificate privateKey: self testPrivateKey as: #rsa;
		yourself.
