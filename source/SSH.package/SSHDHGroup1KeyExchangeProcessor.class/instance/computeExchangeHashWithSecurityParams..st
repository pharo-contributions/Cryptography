private
computeExchangeHashWithSecurityParams: securityParams

	securityParams exchangeHash: (SHA1 hashMessage: (
		(SSHBinaryMessage new stringOn: securityParams clientIdentification asByteArray),
		(SSHBinaryMessage new stringOn: securityParams serverIdentification asByteArray),
		(SSHBinaryMessage new stringOn: securityParams clientKeyInit asByteArray),
		(SSHBinaryMessage new stringOn: securityParams serverKeyInit asByteArray),
		(SSHBinaryMessage new stringOn: securityParams hostPublicKey asSshByteArray),
		(SSHBinaryMessage new mpintOn: self e),
		(SSHBinaryMessage new mpintOn: self f),
		(SSHBinaryMessage new mpintOn: securityParams secretKey))).
	securityParams sessionIdentifier isNil 
		ifTrue: [securityParams sessionIdentifier: securityParams exchangeHash].
