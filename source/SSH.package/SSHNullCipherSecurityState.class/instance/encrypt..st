process
encrypt: data

	^ SSHEncryptedPacket new
		encryptedPayload: ((data packetLength asByteArrayOfSize: 4), 
			data paddingLength asByteArray, 
			data payload, 
			data padding);
		mac: data mac;
		yourself