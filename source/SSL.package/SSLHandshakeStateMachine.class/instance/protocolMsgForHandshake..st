process
protocolMsgForHandshake: handshake

	| msgClasses msgClass |
	msgClasses := SSLHandshakeProtocolMsg handshakeMsgClassesForVersion: self connection version.
	msgClass := msgClasses 
		detect: [:e | e type = handshake msgType]
		ifNone: [^ self error: 'bad handshake failure'].
	^ msgClass fromBytes: handshake body withSecurityParams: self securityParams.
