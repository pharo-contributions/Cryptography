accessing
removeConnection: conn

	conn removeActionsWithReceiver: self.
	self connections remove: conn ifAbsent: [].
