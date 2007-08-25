accessing
payload: anObject
	"Set the value of payload"

	payload := anObject.
	self paddingLength: 4 + (8 - ((self payload size + 5 + 4) \\ 8)).
	self padding: (ByteArray new: self paddingLength withAll: self paddingLength).
	self packetLength: (self payload size + 1 + self padding size).
