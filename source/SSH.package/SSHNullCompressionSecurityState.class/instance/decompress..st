process
decompress: data

	^ SSHPlaintextPacket new
		packetLength: data packetLength;
		paddingLength: data paddingLength;
		payload: data payload;
		padding: data padding;
		yourself