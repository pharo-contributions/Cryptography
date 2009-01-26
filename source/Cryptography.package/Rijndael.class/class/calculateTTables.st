class initialization
calculateTTables
	| a t coef1 coef2 coef3 coef4 |
	T0 _ Array new: 256.
	T1 _ Array new: 256.
	T2 _ Array new: 256.
	T3 _ Array new: 256.

	coef1 _ 2.
	coef2 _ 1.
	coef3 _ 1.
	coef4 _ 3.
	0 to: 255 do: [:avalue  |
		a _ self subByte: avalue.
		t _ ThirtyTwoBitRegister 
			byte1: (self multiply: a by: coef1)
			byte2: (self multiply: a by: coef2)
			byte3: (self multiply: a by: coef3)
			byte4: (self multiply: a by: coef4).
		T0 at: avalue+1 put: t. 
		t _ t copy leftRotateBy: -8.
		T1 at: avalue+1 put: t. 
		t _ t copy leftRotateBy: -8.
		T2 at: avalue+1 put: t. 
		t _ t copy leftRotateBy: -8.
		T3 at: avalue+1 put: t. 
		].
