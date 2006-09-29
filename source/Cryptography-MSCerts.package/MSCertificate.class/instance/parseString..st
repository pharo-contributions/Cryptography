parsing
parseString: aBlobString
	| aStream |
	aStream := aBlobString readStream.
	self keyType: (aStream next: 2).
	self version: (aStream next: 2).
	self reserved: (aStream next: 4).
	self aiKeyAlg: (self parseLongFromLittleEndianInHex: (aStream next: 8)).
	self magic: (self parseMagic: (aStream next: 8)).
	self bitLength: (self parseLongFromLittleEndianInHex: (aStream next: 8)).
	self publicExponent: (self parseLongFromLittleEndianInHex: (aStream next: 8)).
	self modulus_n: (self parseLargePositiveIngeterFromLittleEndianInHex: (aStream next: (self bitLength / 8)*2)).
	self prime1_p: (self parseLargePositiveIngeterFromLittleEndianInHex: (aStream next: (self bitLength / 16)*2)).
	self prime2_q: (self parseLargePositiveIngeterFromLittleEndianInHex: (aStream next: (self bitLength / 16)*2)).
	self exp1_dmodpminus1: (self parseLargePositiveIngeterFromLittleEndianInHex: (aStream next: (self bitLength / 16)*2)).
	self exp2_dmodqminus1: (self parseLargePositiveIngeterFromLittleEndianInHex: (aStream next: (self bitLength / 16)*2)).
	self coefficient_invqmodp: (self parseLargePositiveIngeterFromLittleEndianInHex: (aStream next: (self bitLength / 16)*2)).
	self privateExponent_d: (self parseLargePositiveIngeterFromLittleEndianInHex: (aStream next: (self bitLength / 8)*2)).
	
	
	