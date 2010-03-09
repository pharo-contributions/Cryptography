accessing
vector: aByteArray 
	vector == aByteArray ifFalse: 
		[ "avoid leakage, shred prior vectors before disconnecting them."
		vector ifNotNil: [ vector destroy ].
		vector := aByteArray ]