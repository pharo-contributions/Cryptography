instance creation
example
	"Send 42 down a stack and then reflect it back up."
	"StreamProtocolAdaptor example"

	(StreamProtocolAdaptor new reflect asProtocolStack
		push: StreamProtocolAdaptor new trace;
		push: StreamProtocolAdaptor new trace;
		push: (StreamProtocolAdaptor new trace
				upBlock: [:stream | Transcript cr; show: 'ping ' , stream upToEnd printString]);
		install;
		run;
		first) downcall: 42