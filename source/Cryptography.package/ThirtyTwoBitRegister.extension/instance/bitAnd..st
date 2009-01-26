*cryptography-core-accumulator ops
bitAnd: aThirtTwoBitRegister
	"Replace my contents with the bitwise AND of the given register and my current contents."

	hi _ hi bitAnd: aThirtTwoBitRegister hi.
	low _ low bitAnd: aThirtTwoBitRegister low.
