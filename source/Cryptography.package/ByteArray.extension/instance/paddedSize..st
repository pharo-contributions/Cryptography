*cryptography-core
paddedSize: blockSize
	"If my size is an exact multiple of blockSize, an entire pad-block is required.  That's why we have the +1."
	^ (self size+1) roundUpTo: blockSize