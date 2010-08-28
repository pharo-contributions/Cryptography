accessing
atAllInteger: collection put: transition
	| edge |
	edge := self transitionFor: transition.
	collection do: [:elt | self transitionAt: elt asInteger put: edge]