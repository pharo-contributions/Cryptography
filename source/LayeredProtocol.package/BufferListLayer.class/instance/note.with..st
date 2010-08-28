as yet unclassified
note: aSymbol with: anObject

	super note: aSymbol with: anObject.
	aSymbol == #endpointClosed ifTrue: [^self terminateServer].
	aSymbol == #windowClosed ifTrue: [^self close].