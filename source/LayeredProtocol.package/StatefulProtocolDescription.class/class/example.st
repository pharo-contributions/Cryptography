examples
example
	"A state machine that recognises occurrences of 'x' 'xy' and 'xy[digits...]z' in a stream of characters.  Note: this is used by StateMachineTester, so don't modify it.  See StateMachineTester class>>test for an example of use."
	"StatefulProtocolDescription example"

	| desc |
	desc := self new.
	(desc newState: #initial -> (#echo: -> #initial)) add: $x -> (nil -> #statex).
	(desc newState: #statex -> (#echox: -> #initial)) add: $y -> (#initPrefix: -> #statexy).
	(desc newState: #statexy -> (#echoxy: -> #initial))
		add: $z -> (#echoxyz: -> #initial);
		addAll: '0123456789' -> (#addPrefix: -> nil).
	desc initialState: #initial.
	^desc