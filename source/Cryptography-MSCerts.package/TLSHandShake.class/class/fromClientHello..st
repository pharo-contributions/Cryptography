instance creation
fromClientHello: aClientHello
	"create and return a handshake object"
	^self new
		clientHello: aClientHello;
		yourself