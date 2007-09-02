protocol
send: msg

	self basicSend: msg.
	self writeState incrementSequenceNumber.
