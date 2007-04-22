protocol
basicProcess: data

	super basicProcess: data.
	self readState incrementSequenceNumber.
