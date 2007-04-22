accessing
name
	"Answer the name of the peer."

	self isConnected not
		ifTrue: [^'not connected'].
	^NetNameResolver stringFromAddress: self socket remoteAddress