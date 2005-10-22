accessing
keyID8Hex
	"Return a string with this key's 8-byte ID as hex values"
	| str id dig |
	str := WriteStream on: String new.
	id := self keyID8.
	8 to: 1 by: -1 do: [:i |
		dig := id digitAt: i.
		str nextPut: (Character digitValue: dig // 16).
		str nextPut: (Character digitValue: dig \\ 16).
		i = 5 ifTrue: [str space]].
	^str contents