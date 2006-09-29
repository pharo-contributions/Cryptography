processing
writeHandShakeResponse: aResponse
	"send raw handshake responses to client"
	aResponse rawWriteContentsOn: self writeStream.
	^true