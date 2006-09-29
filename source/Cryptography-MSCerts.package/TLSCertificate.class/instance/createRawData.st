services
createRawData
	| ws certWrapped wrappedItem wrappedSequence |
	ws := ByteArray new writeStream.
	ws nextPutAll: self certificate asn1EncodedCertificate.
	wrappedItem := self wrapItem: ws contents.
	wrappedSequence := self wrapSequence: wrappedItem.
	certWrapped _ self wrapAsCertificate: wrappedSequence.
	self rawData: certWrapped.