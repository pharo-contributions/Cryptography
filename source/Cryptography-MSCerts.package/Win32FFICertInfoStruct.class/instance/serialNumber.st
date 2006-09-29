accessing
serialNumber
	"This method was automatically generated"
	^Win32FFICryptoApiBlobStruct fromHandle: (handle structAt: 5 length: 8)