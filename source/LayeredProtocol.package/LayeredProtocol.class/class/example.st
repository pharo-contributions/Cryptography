examples
example
	"Send 42 down a stack and then reflect it back up."
	"LayeredProtocol example"

	(ProtocolAdaptor new reflect asProtocolStack
		push: ProtocolAdaptor new trace;
		push: ProtocolAdaptor new trace;
		push: (ProtocolAdaptor new trace
				upBlock: [:arg | Transcript cr; show: 'ping ' , arg printString]);
		install;
		run;
		first) downcall: 42