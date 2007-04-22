private
pvtOldListenLoop
	"see comment on ConnectionQueue>>oldStyleListenLoop"
	| socket |
	socket _ nil.

	[ true ] whileTrue: [
		(socket == nil) ifTrue: [
			"try to create a new socket for listening"
			socket _ Socket createIfFail: [ nil ]].

		(socket == nil)
		ifTrue: [(Delay forMilliseconds: 100) wait]
		ifFalse: [
			socket setOption: 'SO_REUSEADDR' value: true.
			socket isUnconnected ifTrue: [ socket listenOn: portNumber ].
			socket waitForConnectionUntil: (Socket deadlineSecs: 10).
			socket isConnected
				ifTrue: ["connection established"
					"mutex critical: [" handlerBlock value: socket "]".
					socket _ nil]
				ifFalse: [
					socket isWaitingForConnection
						ifFalse: [
							socket destroy. 
							socket _ nil. 
							(NetworkError new 
								messageText: 'port unavailable: ', portNumber asString; 
								signal;
								yourself)]].
		].
	]