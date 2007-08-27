process
fromStream: stream

	super fromStream: stream.
	self cookie: (stream next: 16).
	self keyExchangeAlgorithms: (self fromNameListOnStream: stream).
	self serverHostKeyAlgorithms: (self fromNameListOnStream: stream).
	self encryptionAlgorithmsClientToServer: (self fromNameListOnStream: stream).
	self encryptionAlgorithmsServerToClient: (self fromNameListOnStream: stream).
	self macAlgorithmsClientToServer: (self fromNameListOnStream: stream).
	self macAlgorithmsServerToClient: (self fromNameListOnStream: stream).
	self compressionAlgorithmsClientToServer: (self fromNameListOnStream: stream).
	self compressionAlgorithmsServerToClient: (self fromNameListOnStream: stream).
	self languagesClientToServer: (self fromNameListOnStream: stream).
	self languagesServerToClient: (self fromNameListOnStream: stream).
	self firstKeyExchangePacketFollows: (stream next > 0).
