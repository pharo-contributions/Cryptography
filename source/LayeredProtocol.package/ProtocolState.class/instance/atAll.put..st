accessing
atAll: collection put: transition
	| edge |
	edge := self transitionFor: transition.
	collection do: [:elt | self transitionAt: elt put: edge]