as yet unclassified
absoluteFromText: aString
	"Return a URL from a string and handle
	a String without a scheme as a HttpUrl."

	"HttpsUrl absoluteFromText: 'https://www.cacert.org/index.html'" 

	| remainder index scheme fragment newUrl |
	"trim surrounding whitespace"
	remainder := aString withBlanksTrimmed.	

	"extract the fragment, if any"
	index := remainder indexOf: $#.
	index > 0 ifTrue: [
		fragment := remainder copyFrom: index + 1 to: remainder size.
		remainder := remainder copyFrom: 1 to: index - 1].

	"choose class based on the scheme name, and let that class do the bulk of the parsing"
	scheme := self schemeNameForString: remainder.
	newUrl := scheme = 'https'
		ifTrue: [HttpsUrl new privateInitializeFromText: remainder]
		ifFalse: [(self urlClassForScheme: scheme) new privateInitializeFromText: remainder].
	newUrl privateFragment: fragment.
	^newUrl