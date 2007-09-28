process
asByteArray

	^ super asByteArray, 
		(self recipientChannel asByteArrayOfSize: 4),
		(self senderChannel asByteArrayOfSize: 4),
		(self initialWindowSize asByteArrayOfSize: 4),
		(self maximumPacketSize asByteArrayOfSize: 4).
