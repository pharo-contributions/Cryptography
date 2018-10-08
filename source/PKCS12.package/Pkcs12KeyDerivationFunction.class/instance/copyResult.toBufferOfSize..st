private
copyResult: result toBufferOfSize: bufferSize

	| buffer |
	buffer := ByteArray new: bufferSize.
	0 to: bufferSize-1 do: [:i | buffer at: i + 1 put: (result at: (i \\ result size + 1))].
	^ buffer
