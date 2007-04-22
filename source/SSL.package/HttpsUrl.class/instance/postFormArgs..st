as yet unclassified
postFormArgs: args
	| contents |
	contents := HttpsSocket 
		httpsPostDocumentFromUrl: self 
		args: args
		accept: 'application/octet-stream' 
		request: ''.

	^self normalizeContents: contents
