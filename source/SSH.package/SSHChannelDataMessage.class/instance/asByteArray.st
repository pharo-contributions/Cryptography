process
asByteArray

	^ super asByteArray, 
		(self recipientChannel asByteArrayOfSize: 4),
		(self stringOn: self data).
