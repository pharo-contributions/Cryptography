process
decrypt: dataStream

	| packet |
	packet := SSHCompressedWithMACPacket new.
	packet
		packetLength: (dataStream next: 4) asInteger;
		paddingLength: dataStream next;
		payload: (dataStream next: packet packetLength - 1 - packet paddingLength);
		padding: (dataStream next: packet paddingLength);
		mac: (dataStream next: self macHashSize);
		yourself.
	^ packet