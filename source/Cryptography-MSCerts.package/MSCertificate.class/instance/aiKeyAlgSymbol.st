accessing
aiKeyAlgSymbol
	"Answer the value of aiKeyAlg"

	self class algDictionary keyAtValue: (ByteArray fromHexString: self aiKeyAlg) asInteger.