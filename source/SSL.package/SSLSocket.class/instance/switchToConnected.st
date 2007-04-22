private
switchToConnected

	self state: SSLConnectionConnected new.
	[self pendingWriteData isEmpty]
		whileFalse: [self state send: self pendingWriteData removeFirst on: self].
	self triggerEvent: #connected.
