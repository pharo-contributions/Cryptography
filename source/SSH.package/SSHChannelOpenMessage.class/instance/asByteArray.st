process
asByteArray

	^ super asByteArray, 
		(self stringOn: self channelType),
		(self senderChannel asByteArrayOfSize: 4),
		(self initialWindowSize asByteArrayOfSize: 4),
		(self maximumPacketSize asByteArrayOfSize: 4).
