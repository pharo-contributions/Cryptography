process
stop

	conn removeActionsWithReceiver: self.
	process notNil 
		ifTrue: [process terminate].
	process := nil.
	self conn ifNotNil: [self conn close].
	self conn: nil.