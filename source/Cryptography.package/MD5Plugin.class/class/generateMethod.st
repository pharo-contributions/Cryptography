code generation
generateMethod
	"self generateMethod"

	^String streamContents: [ :stream |
		stream nextPutAll: self methodHeader.
		0 to: 63 do: [ :i |
			stream
				nextPutAll: (self round: i);
				nextPutAll: ' " ', (i + 1) asString ,' "' ].
		stream nextPutAll: self methodFooter ]