process
encrypt: data

	| dataStream encryptedStream block |
	dataStream := ((data packetLength asByteArrayOfSize: 4), 
			data paddingLength asByteArray, 
			data payload, 
			data padding) readStream.
	encryptedStream := ReadWriteStream on: (ByteArray new: dataStream size).
	[dataStream atEnd] whileFalse: 
		[block := dataStream next: 8.
		tripleDes encryptBlock: block.
		encryptedStream nextPutAll: block].
	^ SSHEncryptedPacket new
		encryptedPayload: encryptedStream contents;
		mac: data mac;
		yourself