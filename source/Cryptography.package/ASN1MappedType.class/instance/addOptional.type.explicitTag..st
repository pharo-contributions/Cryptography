accessing - element construction
addOptional: aSymbol type: type explicitTag: integer

	^(self add: aSymbol type: type explicitTag: integer)
		optional: true;
		yourself.
