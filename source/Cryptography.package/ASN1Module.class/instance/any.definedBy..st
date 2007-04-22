definitions - mapped
any: aSymbol definedBy: slotSymbol

	^ (ASN1AnyDefinedByType name: aSymbol in: self)
		definedBy: slotSymbol;
		yourself.
