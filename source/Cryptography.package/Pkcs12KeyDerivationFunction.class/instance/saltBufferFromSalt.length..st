private
saltBufferFromSalt: saltIn length: sLen

	| salt |
	salt := ByteArray new: sLen.
	0 to: sLen-1 do: [:i | salt at: i + 1 put: (saltIn at: (i \\ saltIn size + 1))].
	^ salt
