private
nonceBits
	"The number of bits left over for the nonce."
	^ (self blockSize*8) - counterBits