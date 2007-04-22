initialize-release
initialize

	self certificateStore: SSLCertificateStore new.
	self connections: OrderedCollection new.