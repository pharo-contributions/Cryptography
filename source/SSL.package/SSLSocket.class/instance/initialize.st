initialize-release
initialize

	self state: SSLConnectionConnecting new.
	self pendingReadData: OrderedCollection new.
	self pendingWriteData: OrderedCollection new.
