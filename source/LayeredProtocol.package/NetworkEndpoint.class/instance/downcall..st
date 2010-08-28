protocol stack
downcall: char

	socket isConnected
		ifTrue: [socket sendData: (ByteArray with: char)]
		ifFalse: [socket closeAndDestroy]