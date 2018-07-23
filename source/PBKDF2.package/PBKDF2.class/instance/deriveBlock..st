accessing
deriveBlock: i
	| u un |
	un := prf
		key: p;
		digestMessage: s , (i asByteArrayOfSize: 4).
	u := un.
	c - 1
		timesRepeat: [ 
			un := prf digestMessage: un.
			u := u bitXor: un ].
	^ u