accessing
name
	"Answer the name of the peer."

	(socket isNil or: [socket isConnected not])
		ifTrue: [^'not connected'].
	^NetNameResolver stringFromAddress: socket remoteAddress