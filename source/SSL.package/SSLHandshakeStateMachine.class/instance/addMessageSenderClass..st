process
addMessageSenderClass: aMsgSendClass

	self messageSenders add: (aMsgSendClass newOnMachine: self).
