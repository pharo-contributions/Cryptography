private
leftRotate: anInteger by: bits
	"Rotate the given 32-bit integer left by the given number of bits and answer the result."

	self var: #anInteger declareC: 'unsigned int anInteger'.
	^ (anInteger << bits) bitOr: (anInteger >> (32 - bits))
