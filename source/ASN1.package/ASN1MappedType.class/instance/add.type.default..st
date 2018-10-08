accessing - element construction
add: aSymbol type: type default: anObject

	^(self add: aSymbol type: type)
		default: anObject;
		yourself.
