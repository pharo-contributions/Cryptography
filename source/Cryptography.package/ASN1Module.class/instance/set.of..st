definitions - mapped
set: aSymbol of: typeSpec

	^ (ASN1SetOfType name: aSymbol in: self)
		elementType: typeSpec;
		yourself