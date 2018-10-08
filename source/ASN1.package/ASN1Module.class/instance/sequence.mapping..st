definitions - mapped
sequence: aSymbol mapping: mappingClass

	^ (ASN1MappedSequenceType name: aSymbol in: self)
		mapping: mappingClass;
		yourself