private
pvtOldListenLoop
	"see comment on ConnectionQueue>>oldStyleListenLoop"
	| socket |
	socket := nil.

	[ true ] whileTrue: [
		(socket == nil) ifTrue: [
			"try to create a new socket for listening"
			socket := Socket createIfFail: [ nil ]].

		(socket == nil)
		ifTrue: [(Delay forMilliseconds: 100) wait]
		ifFalse: [
			socket setOption: 'SO_REUSEADDR' value: true.
			socket isUnconnected ifTrue: [ socket listenOn: portNumber ].
			socket waitForConnectionUntil: (Socket deadlineSecs: 10).
			socket isConnected
				ifTrue: ["connection established"
					"mutex critical: [" handlerBlock value: socket "]".
					socket := nil]
				ifFalse: [
					socket isWaitingForConnection
						ifFalse: [
							socket destroy. 
							socket := nil. 
							(NetworkError new 
								messageText: 'port unavailable: ', portNumber asString; 
								signal;
								yourself)]].
		].
	]