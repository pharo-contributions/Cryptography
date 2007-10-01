process
asByteArray

	^ super asByteArray, 
		(self recipientChannel asByteArrayOfSize: 4),
		(self bytesToAdd asByteArrayOfSize: 4).