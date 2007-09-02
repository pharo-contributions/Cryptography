process
decrypt: dataStream

	| packet block decryptedStream |
	packet := SSHCompressedWithMACPacket new.
	decryptedStream := #() asByteArray writeStream.
	block := dataStream next: 8.
	tripleDes decryptBlock: block.
	packet packetLength: (block copyFrom: 1 to: 4) asInteger.
	packet packetLength > 35000
		ifTrue: [self error: 'large packet error'].
	packet paddingLength: (block at: 5).
	decryptedStream nextPutAll: (block copyFrom: 6 to: 8).
	(packet packetLength - 4) // 8 timesRepeat: [
		block := dataStream next: 8.
		tripleDes decryptBlock: block.
		decryptedStream nextPutAll: block].
	packet mac: (dataStream next: self macHashSize).
	decryptedStream := decryptedStream contents readStream.
	packet payload: (decryptedStream next: packet packetLength - 1 - packet paddingLength).
	packet padding: (decryptedStream next: packet paddingLength).
	^ packet