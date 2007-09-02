process
verifyMAC: data

	| hash |
	hash := self computeHash: data.
	hash = data mac
		ifFalse: [^ self error: 'bad mac'].
	^ SSHCompressedPacket new
		packetLength: data packetLength;
		paddingLength: data paddingLength;
		payload: data payload;
		padding: data padding;
		yourself