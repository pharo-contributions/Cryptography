protocol
close

	super close.
	self socket notNil ifTrue: [
		self socket closeAndDestroy: 10.
		self socket: nil].
	serverProcess notNil ifTrue: [serverProcess terminate].
	serverProcess := nil. 
