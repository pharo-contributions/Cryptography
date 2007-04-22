*cryptography-core
toEBase64String

	| base64Table stream firstIndex secondIndex thirdIndex fourthIndex extra |
	base64Table := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz=_'.

	stream := String new writeStream.
	1 to: self size - 2 by: 3 do: [:i |
		firstIndex := ((self at: i) bitAnd: 16rFC) >> 2.
		secondIndex := ((((self at: i) bitAnd: 16r03) << 4) bitOr: (((self at: i+1) bitAnd: 16rF0) >> 4)).
		thirdIndex := ((((self at: i+1) bitAnd: 16r0F) << 2) bitOr: (((self at: i+2) bitAnd: 16rC0) >> 6)).
		fourthIndex := ((self at: i+2) bitAnd: 16r3F).
		stream nextPut: (base64Table at: firstIndex + 1).
		stream nextPut: (base64Table at: secondIndex + 1).
		stream nextPut: (base64Table at: thirdIndex + 1).
		stream nextPut: (base64Table at: fourthIndex + 1)].

	extra := self size - (self size // 3 * 3).
	extra = 0 ifTrue: [^ stream contents].
	extra = 1 ifTrue: [
		firstIndex := ((self at: self size) bitAnd: 16rFC) >> 2.
		secondIndex := ((self at: self size) bitAnd: 16r03) << 4.
		stream nextPut: (base64Table at: firstIndex + 1).
		stream nextPut: (base64Table at: secondIndex + 1).
		^ stream contents].
	extra = 2 ifTrue: [
		firstIndex := ((self at: self size - 1) bitAnd: 16rFC) >> 2.
		secondIndex := ((((self at: self size - 1) bitAnd: 16r03) << 4) bitOr: (((self at: self size) bitAnd: 16rF0) >> 4)).
		thirdIndex := ((self at: self size) bitAnd: 16r0F) << 2.
		stream nextPut: (base64Table at: firstIndex + 1).
		stream nextPut: (base64Table at: secondIndex + 1).
		stream nextPut: (base64Table at: thirdIndex + 1).
		^ stream contents].
