process
asByteArray

	^ super asByteArray, 
		(self stringOn: self publicHostKeyAndCertificates),
		(self mpintOn: self f),
		(self stringOn: self signature).
