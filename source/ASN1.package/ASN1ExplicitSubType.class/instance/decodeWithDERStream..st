decoding
decodeWithDERStream: derStream

	derStream nextTag.
	derStream nextLength.
	^ self parent decodeWithDERStream: derStream.
