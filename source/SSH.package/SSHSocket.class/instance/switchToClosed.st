private
switchToClosed

	self state: SSLConnectionClosed new.
	self connPipe: nil.
	self triggerEvent: #closed.
