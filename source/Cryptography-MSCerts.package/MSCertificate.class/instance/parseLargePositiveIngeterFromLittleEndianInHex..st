parsing
parseLargePositiveIngeterFromLittleEndianInHex: aByteLittleEndianInhex
	| aByteArray |
	aByteArray := ByteArray fromHexString: aByteLittleEndianInhex.
	^aByteArray reverse inject: 0 into: [:aSum :aByte |
		aSum := (aSum bitShift: 8) bitOr: aByte.
	].
