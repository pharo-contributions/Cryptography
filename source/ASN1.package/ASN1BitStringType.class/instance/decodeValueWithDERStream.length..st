decoding
decodeValueWithDERStream: derStream length: length

	| bitString |
	bitString := ASN1BitString new.
	bitString bitsPadding: derStream next.
	bitString bytes: (derStream next: length - 1).
	^ bitString
