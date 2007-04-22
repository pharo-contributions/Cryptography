definitions - mapped
sequence: aSymbol of: typeSpec

	^ (ASN1SequenceOfType name: aSymbol in: self)
		elementType: typeSpec;
		yourself