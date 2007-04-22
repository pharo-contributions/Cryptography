api
header: headerText
	"set the headers.  Then getHeader: can be used"

	"divide into basic lines"
	| lines foldedLines i statusLine |
	lines _ headerText findTokens: (String with: Character cr  with: Character linefeed).
	statusLine _ lines first.
	lines _ lines copyFrom: 2 to: lines size.

	"parse the status (pretty trivial right now)"
	responseCode _ (statusLine findTokens: ' ') second.

	"fold lines that start with spaces into the previous line"
	foldedLines _ OrderedCollection new.
	lines do: [ :line |
		line first isSeparator ifTrue: [
			foldedLines at: foldedLines size  put: (foldedLines last, line) ]
		ifFalse: [ foldedLines add: line ] ].

	"make a dictionary mapping headers to header contents"
	headers _ Dictionary new.
	foldedLines do: [ :line |
		i _ line indexOf: $:.
		i > 0 ifTrue: [
			headers 
			at: (line copyFrom: 1 to: i-1) asLowercase 
			put: (line copyFrom: i+1 to: line size) withBlanksTrimmed ] ].
