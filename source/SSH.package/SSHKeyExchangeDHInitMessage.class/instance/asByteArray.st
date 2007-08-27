process
asByteArray

	^ super asByteArray, 
		(self mpintOn: self e).
