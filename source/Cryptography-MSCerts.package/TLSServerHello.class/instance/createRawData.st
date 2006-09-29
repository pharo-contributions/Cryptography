services
createRawData
	"create the raw data that is sent back to the client"
	| ws serverHelloWrapped |
	ws _ ByteArray new writeStream.
	ws nextPutAll: self serverVersionByteArray.
	ws nextPutAll: self random.
	ws nextPutAll: 32 asByteArray, self sessionID.
	ws nextPutAll: self cipherSuiteByteArray.
	ws nextPutAll: self compressionMethod asByteArray.
	serverHelloWrapped _ self wrapAsServerHello: ws contents.
	self rawData: (self wrapAsTLSHandShakeMessage: serverHelloWrapped).
	