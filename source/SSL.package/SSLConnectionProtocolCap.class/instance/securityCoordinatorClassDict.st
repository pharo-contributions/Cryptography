initialize-release
securityCoordinatorClassDict

	^ Dictionary new
		at: SSLProtocolVersion ssl30 put: SSL30SecurityCoordinator;
		at: SSLProtocolVersion tls10 put: TLS10SecurityCoordinator;
		at: SSLProtocolVersion tls11 put: TLS11SecurityCoordinator;
		yourself