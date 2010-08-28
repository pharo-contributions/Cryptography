protocol stack
note: aSymbol with: anObject

	super note: aSymbol with: anObject.
	aSymbol == #oobInlineEndpoint	ifTrue: [^socket setOption: 'SO_OOBINLINE' value: 1].
	aSymbol == #savePreferences		ifTrue: [^self savePreferences: anObject].