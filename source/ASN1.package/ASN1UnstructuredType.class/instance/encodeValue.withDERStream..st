encoding
encodeValue: anObject withDERStream: derStream

	anObject do: [:each |
		self elementType 
			encode: each 
			withDERStream: derStream].
