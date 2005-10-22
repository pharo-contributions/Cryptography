*openPGP-accumulator ops
-= aThirtyTwoBitRegister
	"Replace my contents with the difference of the given register and my current contents."

	| carry |
	low := low - aThirtyTwoBitRegister low.
	low < 0
		ifTrue: [low := low + 65536. carry := 1]
		ifFalse: [carry := 0].
	hi := (hi - aThirtyTwoBitRegister hi - carry+ 65536) bitAnd: 16rFFFF