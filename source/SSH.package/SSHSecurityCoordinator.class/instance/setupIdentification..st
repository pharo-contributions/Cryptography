key init
setupIdentification: identMsg

	self isClient
		ifTrue: [self securityParams clientIdentification: identMsg]
		ifFalse: [self securityParams serverIdentification: identMsg].
	^ identMsg
