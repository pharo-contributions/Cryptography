decoding
decodeValueWithDERStream: derStream length: length

	^(derStream next: length) asByteArray