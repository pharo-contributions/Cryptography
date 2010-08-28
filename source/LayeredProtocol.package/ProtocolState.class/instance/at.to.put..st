accessing
at: anObject to: limit put: transition

	| edge |
	edge := self transitionFor: transition.
	anObject to: limit do: [:target | self transitionAt: target put: edge]