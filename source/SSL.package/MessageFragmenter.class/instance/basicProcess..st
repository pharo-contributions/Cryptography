protocol
basicProcess: data

	super basicProcess: data.
	self writeState incrementSequenceNumber.
