process
encrypt: data

	^ SSHEncryptedPacket new
		packetLength: data packetLength;
		paddingLength: data paddingLength;
		payload: data payload;
		padding: data padding;
		mac: data mac;
		yourself