control
serverLoop

	[self processBuffer] 
			ensure: [
				serverProcess := nil. 
				self sessionNote: #endpointClosed.
				self close].
