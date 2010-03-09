accessing
key: aByteArray
"	nK := aByteArray size * 8 / 32."
	self setSystem.
	self expandKey: aByteArray.
	self eqExpandKey