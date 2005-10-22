accessing
stringToKey: aString preload: num
	| message i |
	(type = 3 and: [hashAlgorithm = 2]) ifFalse: [
		self error: 'Only SHA-1 supported at the moment'].
	message := ByteArray new: (count max: aString size + salt size) + num.
	i := 1 + num.
	[i <= message size] whileTrue: [
		message
			replaceFrom: i
			to: (i + salt size-1 min: message size)
			with: salt
			startingAt: 1.
		i := i + salt size.
		i <= message size ifTrue: [
			message
				replaceFrom: i
				to: (i + aString size-1 min: message size)
				with: aString
				startingAt: 1.
			i := i + aString size]].
	^SecureHashAlgorithm new hashMessage: message