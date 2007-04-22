*cryptography-core
fromHexString: hexString 
	"Returns a byteArray from a hex string. The hex string can have
	leading zeros that will not be truncated, preserving the size of the
	byteArray for things like cyrptograpy"
	| anInteger hexSize stringSize aStringOfHex |
	aStringOfHex := (hexString copyWithoutAll: (Array with: $  with: Character cr with: Character tab)).
	stringSize _ aStringOfHex size.
	(stringSize > 3
			and: [(aStringOfHex copyFrom: 1 to: 3) = '16r'])
		ifTrue: [anInteger _ Number readFrom: (aStringOfHex asUppercase at: 3 put: $r;
							 yourself).
			hexSize _ aStringOfHex size - 3 / 2]
		ifFalse: [anInteger _ Number readFrom: aStringOfHex asUppercase base: 16.
			hexSize _ aStringOfHex size / 2].
	^ anInteger asByteArrayOfSize: hexSize asInteger