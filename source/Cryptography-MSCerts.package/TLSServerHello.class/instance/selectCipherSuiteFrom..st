services
selectCipherSuiteFrom: aClientHello
	"select a supported cipherSuite from the list of preferred cipher suites in the client hello"
	^TLSCipherSuite getSupportedSuiteFrom: aClientHello cipherSuites