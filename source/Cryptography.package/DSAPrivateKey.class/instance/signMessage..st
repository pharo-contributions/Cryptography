as yet unclassified
signMessage: aStringOrStream
	| hasher h sig |

	hasher _ SHA1 new.
	(aStringOrStream class isBytes)
		ifTrue: [h _ hasher hashMessage: aStringOrStream]
		ifFalse: [h _ hasher hashStream: aStringOrStream].
	sig _ self computeSignatureForMessageHash: h.
	^ self signatureToString: sig