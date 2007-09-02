conversions
mpintOn: int

	| integer stream |
	integer := int.
	integer = 0 ifTrue: [^ #(0 0 0 0) asByteArray].
	stream := #() asByteArray writeStream.
	integer positive
		ifTrue: [
			(integer lastDigit allMask: 16r80) 
				ifTrue: [stream nextPut: 0]]
		ifFalse: [
			integer := integer negated twosComplement.
			(integer lastDigit noMask: 16r80)
				ifTrue: [stream nextPut: 16rFF]].
	stream nextPutAll: integer asByteArray.
	^ (stream size asByteArrayOfSize: 4), stream contents
	