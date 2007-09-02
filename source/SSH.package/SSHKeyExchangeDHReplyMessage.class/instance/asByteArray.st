process
asByteArray

	self encodePublicHostKeyAndCertificates.
	self encodeSignature.
	^ super asByteArray, 
		(self stringOn: self publicHostKeyAndCertificates),
		(self mpintOn: self f),
		(self stringOn: self signature).
