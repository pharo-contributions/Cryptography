accessing
protocolVersion: hexString
	"set the highest version of ssl that the client is able to speak, 
	currently 00 02 = SSL 2,0, 03 00 = SSL 3.0  03 01 = TLS 1.0"
	
	^protocolVersion _ hexString