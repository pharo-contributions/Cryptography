process
package: msg

	| bytes |
	bytes := msg asByteArray.
	^ SSHPlaintextPacket new
		packetLength: bytes size + 1;
		paddingLength: 0;
		payload: bytes;
		padding: #() asByteArray;
		yourself.
