accessing - element construction
add: aSymbol type: type

	^self addElement: (
		self newElement
			symbol: aSymbol;
			type: (self typeFrom: type))