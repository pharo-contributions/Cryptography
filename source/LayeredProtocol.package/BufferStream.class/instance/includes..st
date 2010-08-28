testing
includes: aChar
	"answer whether buffer includes aChar within bounds"
	| tmp |
	tmp := buffer 
		indexOf: aChar 
		startingAt: startPos
		ifAbsent: [0].
	^(tmp >= startPos) and: [tmp <= endPos]