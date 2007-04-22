definitions - mapped
implicit: aSymbol type: type tag: tag

	^ (ASN1ImplicitSubType name: aSymbol in: self)
		parent: type;
		tag: tag;
		yourself
