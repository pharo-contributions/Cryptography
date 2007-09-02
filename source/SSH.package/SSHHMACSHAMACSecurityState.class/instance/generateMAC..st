process
generateMAC: data

	^ SSHCompressedWithMACPacket new
		packetLength: data packetLength;
		paddingLength: data paddingLength;
		payload: data payload;
		padding: data padding;
		mac: (self computeHash: data);
		yourself