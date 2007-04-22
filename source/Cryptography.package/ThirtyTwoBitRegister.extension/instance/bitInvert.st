*cryptography-core-accumulator ops
bitInvert
	"Replace my contents with the bitwise inverse my current contents."

	hi _ hi bitXor: 16rFFFF.
	low _ low bitXor: 16rFFFF.
