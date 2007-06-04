api
canSign

	self certStore ownerCerts notEmpty ifFalse: [^ false].
	^ self certStore validateOwnerCertChain
