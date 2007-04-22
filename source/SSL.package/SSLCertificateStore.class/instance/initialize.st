initialize-release
initialize

	certificates := Dictionary new.
	privateKeys := Dictionary new.
	rootCerts := OrderedCollection new.
	self initializeRootCerts.
