decoding
decodeValueWithDERStream: derStream length: length

	| string |
	string := (derStream next: length) asByteArray asString.
	^ self wrapperClass fromString: string.
