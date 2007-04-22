*cryptography-core-accumulator ops
bitOr: aThirtTwoBitRegister
	"Replace my contents with the bitwise OR of the given register and my current contents."

	hi _ hi bitOr: aThirtTwoBitRegister hi.
	low _ low bitOr: aThirtTwoBitRegister low.
