examples
example2
	"NetworkEndpoint example2"

	| s |
	NetworkEndpoint new
		socket: ((s := Socket initializeNetwork; new)
					connectTo: (NetNameResolver addressForName: 'localhost') port: 7;
					waitForConnectionUntil: (Socket deadlineSecs: 1);
					yourself);
		up: (ProtocolAdaptor new
				upBlock: [:arg | Transcript nextPut: arg asCharacter; endEntry]);
		run.
	s sendData: 'send this back to me'.
	(Delay forSeconds: 1) wait.
	s close