examples
example
	"NetworkEndpoint example"

	^NetworkEndpoint new
		socket: ((Socket initializeNetwork; new)
					connectTo: (NetNameResolver addressForName: 'localhost') port: 13;
					waitForConnectionUntil: (Socket deadlineSecs: 1);
					yourself);
		up: (ProtocolAdaptor new
				upBlock: [:arg | Transcript nextPut: arg asCharacter; endEntry]);
		run.