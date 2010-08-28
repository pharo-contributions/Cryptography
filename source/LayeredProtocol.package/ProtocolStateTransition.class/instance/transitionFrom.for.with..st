state transitions
transitionFrom: lastState for: aClient with: anObject

	action isNil ifFalse: [aClient perform: action with: anObject].
	^state isNil ifTrue: [lastState] ifFalse: [state]