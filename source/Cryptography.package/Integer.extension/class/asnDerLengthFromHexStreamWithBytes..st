*Cryptography-ASN1
asnDerLengthFromHexStreamWithBytes: aStream

	| byte length bytes |
	bytes := OrderedCollection new.
	byte := (Number readFrom: ((bytes add: aStream next) ifNil: [^0->#()]) asUppercase base: 16).
	byte <= 16r80
		ifTrue: [^byte->bytes merge]
		ifFalse: [
			length := 0.
			(byte bitAnd: 16r7F) timesRepeat: [
				length := (length bitShift: 8) bitOr: (Number readFrom: (bytes add: aStream next) asUppercase base: 16).].
			^ length->(bytes merge)].