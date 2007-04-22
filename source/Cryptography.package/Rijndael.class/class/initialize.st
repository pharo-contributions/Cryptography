class initialization
initialize
	self initializeLogTable.
	self initializeLogInverseTable.
	self initializeRoundConstant.
	self initializeSubByte.
	self initializeSubByteInverse.

	self calculateTTables.
	self calculateInvTTables