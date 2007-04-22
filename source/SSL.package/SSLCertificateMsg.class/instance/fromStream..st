converting
fromStream: stream

	| certificatesLength processedSize nextCertificateLength asn1Bytes cert |
	self certificateList: OrderedCollection new.
	certificatesLength := (stream next: 3) asInteger.
	processedSize := 0.
	[processedSize < certificatesLength]
		whileTrue: [
			nextCertificateLength := (stream next: 3) asInteger.
			processedSize := 3 + processedSize + nextCertificateLength.
			asn1Bytes := stream next: nextCertificateLength.
			cert := X509Certificate fromBytes: asn1Bytes.
			self certificateList add: cert].

	
