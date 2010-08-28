examples
example3		"Note: this example should pop up an error notifier during compilation"

	"StatefulProtocolDescription example3 compile"

	| desc |
	desc := self new.
	(desc newState: #initial -> (#echo: -> #initial)) add: $x -> (nil -> #statex).
	(desc newState: #statex -> (#echox: -> #initial)) add: $y -> (nil -> #statexy).
	(desc newState: #statexy -> (#echoxy: -> #initial)) add: $z -> (#echoxy: -> #statexyz).
	desc initialState: #initial.
	^desc