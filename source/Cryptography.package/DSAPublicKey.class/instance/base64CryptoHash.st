as yet unclassified
base64CryptoHash

	| encoded hash |
	encoded := self asAsn1Bytes.
	((encoded first bitAnd: 16r80) > 0)
		ifTrue: [encoded := #(0) asByteArray, encoded].
	hash := (SHA1 hashMessage: encoded) asByteArray reversed.
	((hash first bitAnd: 16r80) > 0)
		ifTrue: [hash := #(0) asByteArray, hash].
	^ hash toEBase64String
