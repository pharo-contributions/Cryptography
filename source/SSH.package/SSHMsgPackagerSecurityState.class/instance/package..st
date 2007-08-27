process
package: msg

	| bytes |
	bytes := msg asByteArray.
	^ SSHPlaintextPacket new
		payload: bytes;
		computeLengthsAndPadding;
		yourself.
