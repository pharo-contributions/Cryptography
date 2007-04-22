class initialization
calculateInvTTables
	| a t coef1 coef2 coef3 coef4 |
	InvT0 _ Array new: 256.
	InvT1 _ Array new: 256.
	InvT2 _ Array new: 256.
	InvT3 _ Array new: 256.

	coef1 _ 14.
	coef2 _ 9.
	coef3 _ 13.
	coef4 _ 11.
	0 to: 255 do: [:avalue  |
		a _ self subByteInverse: avalue.
		t _ ThirtyTwoBitRegister 
			byte1: (self multiply: a by: coef1)
			byte2: (self multiply: a by: coef2)
			byte3: (self multiply: a by: coef3)
			byte4: (self multiply: a by: coef4).
		InvT0 at: avalue+1 put: t. 
		t _ t copy leftRotateBy: -8.
		InvT1 at: avalue+1 put: t. 
		t _ t copy leftRotateBy: -8.
		InvT2 at: avalue+1 put: t. 
		t _ t copy leftRotateBy: -8.
		InvT3 at: avalue+1 put: t. 
		].
