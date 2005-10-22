reading
readFrom: aStream
	type := aStream next.
	(#(0 1 3) includes: type) ifFalse: [self error: 'Unknown string-to-key specifier'].
	hashAlgorithm := aStream next.
	(type bitAnd: 1) = 1 ifTrue: [salt := aStream next: 8].
	(type bitAnd: 2) = 2 ifTrue: [
		count := aStream next.
		count := count \\ 16 + 16 bitShift: count // 16 + 6]