examples
example
	"ProtocolState example"

	^(self name: #initial default: #echo: -> #initial)
		at: 42 put: #echo42: -> #initial;
		yourself