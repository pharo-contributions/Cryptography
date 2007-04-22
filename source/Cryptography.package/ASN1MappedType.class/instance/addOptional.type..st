accessing - element construction
addOptional: aSymbol type: type

	^(self add: aSymbol type: type)
		optional: true;
		yourself.
