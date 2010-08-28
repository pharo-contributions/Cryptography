accessing
upToAll: aString
	"return a string before the occurence of aString, if any"
	"consume it"
	| i |
	i := buffer 
		indexOfSubCollection: aString 
		startingAt: startPos
		ifAbsent: [0].
	(i <= 0 or: [i > endPos])
		ifTrue: [^self upToEnd].
	^self next: (i-startPos)