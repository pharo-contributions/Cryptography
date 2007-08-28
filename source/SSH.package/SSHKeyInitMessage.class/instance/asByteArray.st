process
asByteArray

	^ super asByteArray, 
		self cookie, 
		(self nameListOn: self keyExchangeAlgorithms),
		(self nameListOn: self serverHostKeyAlgorithms),
		(self nameListOn: self encryptionAlgorithmsClientToServer),
		(self nameListOn: self encryptionAlgorithmsServerToClient),
		(self nameListOn: self macAlgorithmsClientToServer),
		(self nameListOn: self macAlgorithmsServerToClient),
		(self nameListOn: self compressionAlgorithmsClientToServer),
		(self nameListOn: self compressionAlgorithmsServerToClient),
		(self nameListOn: self languagesClientToServer),
		(self nameListOn: self languagesServerToClient),
		(self firstKeyExchangePacketFollows ifTrue: [#(1)] ifFalse: [#(0)]),
		(0 asByteArrayOfSize: 4).
