accessing
next
	"return the next character"
	"consume it"
	^buffer at: (startPos := startPos + 1) - 1