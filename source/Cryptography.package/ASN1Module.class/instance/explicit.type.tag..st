definitions - mapped
explicit: aSymbol type: type tag: tag

	^ (ASN1ExplicitSubType name: aSymbol in: self)
		parent: type;
		tag: tag;
		yourself
