compiling
compile
	"Compile my symbolic representation into a cyclic DAG and answer the root node"

	| edge |
	self valuesDo: [:state |
		state defaultTransition: (self resolve: state default).
		state keysDo: [:key |
			edge := state at: key.
			state transitionAt: key put: (self resolve: edge)]].
	
	^self at: initialState