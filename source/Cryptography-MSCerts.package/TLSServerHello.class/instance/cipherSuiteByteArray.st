accessing
cipherSuiteByteArray
	"converts a hex string to a ByteArray"
	^ByteArray fromHexString: self cipherSuite cipherID.