process
decrypt: data

	| stream packet |
	stream := data readStream.
	packet := SSHCompressedWithMACPacket new.
	packet
		packetLength: (stream next: 4) asInteger;
		paddingLength: stream next.
	packet 
		payload: (stream next: packet packetLength);
		padding: (stream next: packet paddingLength);
		mac: (stream next: self macHashSize);
		yourself.
	^ packet