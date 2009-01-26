*cryptography-core-accumulator ops
+= aThirtTwoBitRegister
	"Replace my contents with the sum of the given register and my current contents."

	| lowSum |
	lowSum _ low + aThirtTwoBitRegister low.
	hi _ (hi + aThirtTwoBitRegister hi + (lowSum bitShift: -16)) bitAnd: 16rFFFF.
	low _ lowSum bitAnd: 16rFFFF.
