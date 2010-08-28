accessing
upTo: aChar
	"return String up to aChar, but not including"
	"consumes the returned string"
	| i |
	i := buffer 
		indexOf: aChar 
		startingAt: startPos
		ifAbsent: [0].
	(i <= 0 or: [i > endPos])
		ifTrue: [^self upToEnd].
	^self next: (i-startPos)