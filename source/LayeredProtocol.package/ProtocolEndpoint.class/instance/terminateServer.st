server loop
terminateServer
	"Terminate the serverLoop process.  This should never be called directly: use #close instead."

	serverProcess isNil
		ifFalse:
			[serverProcess terminate.
			 serverProcess _ nil.
			 self sessionNote: #disconnected.
			 Transcript cr; show: self class name, ' server terminated']