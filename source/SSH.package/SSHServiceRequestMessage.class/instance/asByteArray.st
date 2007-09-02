process
asByteArray

	^ super asByteArray, 
		(self stringOn: self serviceName).
