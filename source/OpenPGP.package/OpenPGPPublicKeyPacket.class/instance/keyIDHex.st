accessing
keyIDHex
	"Return a string with this key's ID as hex values"
	| str id dig |
	str := WriteStream on: String new.
	id := self keyID.
	4 to: 1 by: -1 do: [:i |
		dig := id digitAt: i.
		str nextPut: (Character digitValue: dig // 16).
		str nextPut: (Character digitValue: dig \\ 16)].
	^str contents