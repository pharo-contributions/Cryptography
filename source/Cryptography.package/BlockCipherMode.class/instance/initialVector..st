accessing
initialVector: aByteArray
	"avoid leakage, shred prior vectors before disconnecting them."
	self vector: aByteArray