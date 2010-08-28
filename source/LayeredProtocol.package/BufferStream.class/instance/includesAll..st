testing
includesAll: aString
	"answer whether the buffer contains aString"
	| tmp |
	tmp := buffer indexOfSubCollection: aString startingAt: startPos.
	^(tmp >= startPos) and: [tmp <= endPos]