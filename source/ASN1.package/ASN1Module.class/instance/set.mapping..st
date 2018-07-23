definitions - mapped
set: aSymbol mapping: mappingClass

	^ (ASN1MappedSetType name: aSymbol in: self)
		mapping: mappingClass;
		yourself