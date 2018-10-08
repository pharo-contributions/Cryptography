encoding
encodeValue: anObject withDERStream: derStream

	anObject do: [:each |
		derStream encode: each].
