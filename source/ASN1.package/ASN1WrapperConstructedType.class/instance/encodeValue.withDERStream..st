encoding
encodeValue: anObject withDERStream: derStream

	anObject tagValue do: [:each |
		derStream encode: each].
	
