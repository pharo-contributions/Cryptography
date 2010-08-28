control
terminateServer
	"Terminate the serverLoop process.  This should never be called directly: use #close instead."

	serverProcess isNil
		ifFalse:
			[serverProcess terminate.
			 serverProcess := nil.
			 self sessionNote: #disconnected]