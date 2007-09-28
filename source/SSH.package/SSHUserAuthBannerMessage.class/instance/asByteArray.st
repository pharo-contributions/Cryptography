process
asByteArray

	^ super asByteArray, 
		(self stringOn: self message),
		(self stringOn: self language).
