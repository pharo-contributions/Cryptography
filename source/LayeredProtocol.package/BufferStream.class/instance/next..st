accessing
next: anInteger
	"return next anInteger characters"
	"consumes them"
	^buffer copyFrom: startPos to: (startPos := startPos + anInteger) - 1