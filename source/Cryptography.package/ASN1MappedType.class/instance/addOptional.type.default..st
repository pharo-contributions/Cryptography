accessing - element construction
addOptional: aSymbol type: type default: anObject

	^(self add: aSymbol type: type)
		optional: true;
		default: anObject;
		yourself.
