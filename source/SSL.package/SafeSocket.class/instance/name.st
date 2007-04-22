accessing
name
	"Answer the name of the peer."

	^self isConnected
		ifTrue: [hostName isNil ifTrue: [NetNameResolver stringFromAddress: self remoteAddress] ifFalse: [hostName]]
		ifFalse: ['not connected']