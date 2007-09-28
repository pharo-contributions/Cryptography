process
addMsgSenderClass: aMsgSendClass

	self messageSenders add: (aMsgSendClass newOnMachine: self).
