protocol
downcall: anObject
	"Receive anObject from my high protocol.  The default behaviour (in Protocol) is to pass it down to my low protocol.  ProtocolEndpoints however are at the bottom of the ProtocolStack and thus have no low protocol, so they have to treat this specially (e.g., by sending the data over the network or to another process)."

	^self subclassResponsibility