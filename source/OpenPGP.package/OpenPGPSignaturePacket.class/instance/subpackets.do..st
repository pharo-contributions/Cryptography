private
subpackets: aByteArray do: aBlock
	| str len |
	str := OpenPGPStream on: aByteArray.
	[str atEnd] whileFalse: [
		len := str nextNewFormatPacketLength.
		aBlock value: (str next: len)]