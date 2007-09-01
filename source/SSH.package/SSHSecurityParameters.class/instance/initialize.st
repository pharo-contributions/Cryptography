initialize-release
initialize

	self bulkCipherAlgorithm: #ascii.
	self compressionAlgorithm: 'none'.
	self macAlgorithm: #null.
	self packagerAlgorithm: #initial.
	self hashSize: 0.