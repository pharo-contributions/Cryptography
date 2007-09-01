private
computeExchangeHashWithSecurityParams: securityParams

	| msg |
	msg := SSHBinaryMessage new.
	securityParams exchangeHash: (SHA1 hashMessage: (
		(securityParams clientIdentification asByteArray),
		(securityParams serverIdentification asByteArray),
		(msg stringOn: securityParams clientKeyInit asByteArray),
		(msg stringOn: securityParams serverKeyInit asByteArray),
		(msg stringOn: securityParams hostPublicKey asSshByteArray),
		(msg mpintOn: self e),
		(msg mpintOn: self f),
		(msg mpintOn: securityParams secretKey asInteger))).
	securityParams sessionIdentifier isNil 
		ifTrue: [securityParams sessionIdentifier: securityParams exchangeHash].
