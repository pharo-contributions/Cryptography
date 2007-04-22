testing
example2

	DuplexProtocolStack new
		pushUp: (TraceProtocol new tag: 'process up'; yourself);
		pushDown: (TraceProtocol new tag: 'process down'; yourself);
		yourself.
