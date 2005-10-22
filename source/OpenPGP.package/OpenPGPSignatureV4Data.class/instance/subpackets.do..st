accessing
subpackets: aByteArray do: aBlock
	| str len |
	str := OpenPGPStream on: (ReadStream on: aByteArray).
	[str atEnd] whileFalse: [
		len := str nextNewFormatPacketLength.
		aBlock value: (str next: len)]