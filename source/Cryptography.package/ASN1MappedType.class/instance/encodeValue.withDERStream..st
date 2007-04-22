encoding
encodeValue: anObject withDERStream: derStream

	self elements do: [:each |
		each encode: anObject withDERStream: derStream].
