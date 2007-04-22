running
startAtPort: port

	self listener: (ConnectionListener 
		onPort: port
		handler: [:socket | self serveSocket: socket]
		priority: Processor highIOPriority) start.

