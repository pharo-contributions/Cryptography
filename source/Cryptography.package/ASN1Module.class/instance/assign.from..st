definitions - mapped
assign: aSymbol from: otherSymbol

	^ (ASN1AssignmentSubType name: aSymbol in: self)
		parent: otherSymbol;
		yourself