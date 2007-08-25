protocol
close

	super close.
	self socketStream notNil ifTrue: [
		self socketStream close.
		self socketStream: nil].
	serverProcess notNil ifTrue: [serverProcess terminate].
	serverProcess := nil. 
