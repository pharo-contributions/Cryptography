accessing
key: aByteArray
"	nK _ aByteArray size * 8 / 32."
	self setSystem.
	self expandKey: aByteArray.
	self eqExpandKey