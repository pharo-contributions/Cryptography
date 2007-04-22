accessing - element construction
addOptional: aSymbol type: type implicitTag: integer

	^(self add: aSymbol type: type implicitTag: integer)
		optional: true;
		yourself.
