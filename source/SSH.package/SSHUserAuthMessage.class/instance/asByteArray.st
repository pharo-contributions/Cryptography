process
asByteArray

	^ super asByteArray, 
		(self stringOn: self userName),
		(self stringOn: self serviceName),
		(self stringOn: self methodName).
