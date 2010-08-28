protocol stack
downcallAll: collection
	"This is just for speed in telnet negotiation."

	socket isConnected
		ifTrue: [socket sendData: collection]
		ifFalse: [socket closeAndDestroy]