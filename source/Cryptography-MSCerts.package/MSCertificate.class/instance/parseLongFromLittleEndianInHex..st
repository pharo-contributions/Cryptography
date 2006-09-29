parsing
parseLongFromLittleEndianInHex: aByteLittleEndianInhex
	^(ByteArray fromHexString: aByteLittleEndianInhex) unsignedLongAt: 1 bigEndian: false