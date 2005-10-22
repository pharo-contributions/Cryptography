accessing
fingerprintHex
	"Return a string with this key's fingerprint.
	Version 3 has 16 8-bit hex values; version 4 has 10 16-bit hex values"
	| str fp dig n |
	str := WriteStream on: String new.
	fp := self fingerprint.
	n := self version = 3 ifTrue: [16] ifFalse: [20].
	n to: 1 by: -1 do: [:i |
		dig := fp digitAt: i.
		str nextPut: (Character digitValue: dig // 16).
		str nextPut: (Character digitValue: dig \\ 16).
		(n = 16 or: [i odd]) ifTrue: [str space.
			i = (n/2+1) ifTrue: [str space]]].
	^str contents