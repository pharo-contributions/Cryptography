examples
example3
	"NetworkEndpoint example3"

	| ep |
	(ep := NetworkEndpoint newConnection: 'localhost' port: 7)
		up: (ProtocolAdaptor upBlock:
				[:arg | Transcript nextPut: arg asCharacter; endEntry]);
		run.
	ep socket sendData: 'send this back to me'.
	(Delay forSeconds: 1) wait.
	ep socket close