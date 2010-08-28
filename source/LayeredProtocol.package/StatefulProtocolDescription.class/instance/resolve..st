compiling
resolve: edge

	| target action |
	target := edge state.
	action := edge action.
	target := (self includesKey: target)
		ifTrue: [self at: target]
		ifFalse: [target isNil
					ifTrue: [nil]
					ifFalse: [self error: 'unknown target state ' , edge printString]].
	^ProtocolStateTransition action: action state: target