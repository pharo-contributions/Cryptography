protocol
process: data

	Transcript cr; nextPutAll: self tag, ' ' , data printString; endEntry.
	self basicProcess: data.