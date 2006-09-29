accessing
signatureAlgorithm
	"This method was automatically generated"
	^Win32FFICryptAlgorithmIdentifierStruct fromHandle: (handle structAt: 13 length: 12)