*cryptography-core-accumulator ops
bitXor: aThirtTwoBitRegister
	"Replace my contents with the bitwise exclusive OR of the given register and my current contents."

	hi _ hi bitXor: aThirtTwoBitRegister hi.
	low _ low bitXor: aThirtTwoBitRegister low.
