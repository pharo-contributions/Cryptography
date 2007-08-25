initialize-release
initialize

	self bulkCipherAlgorithm: #ascii.
	self compressionAlgorithm: #null.
	self macAlgorithm: #null.
	self packagerAlgorithm: #initial.
	self hashSize: 0.