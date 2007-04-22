as yet unclassified
retrieveContentsArgs: args accept: mimeType

	| contents |
	contents _ (HttpsSocket
		httpsGetDocumentFromUrl: self withoutFragment
		args: args
		accept: mimeType
		request: '').

	^ self normalizeContents: contents