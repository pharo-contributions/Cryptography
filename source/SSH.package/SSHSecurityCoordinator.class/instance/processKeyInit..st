key init
processKeyInit: keyInitMsg

	self isClient
		ifTrue: [self securityParams serverKeyInit: keyInitMsg]
		ifFalse: [self securityParams clientKeyInit: keyInitMsg].
	self setupKeyExchangeProcessor.
	self setupEncryptionChoices.
