accessing
upToEnd
	"return buffer contents,
	consume all my buffer"
	| string |
	string := self contents.
	self reset.
	^string