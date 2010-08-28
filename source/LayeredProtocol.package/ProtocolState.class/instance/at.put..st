accessing
at: key put: transition

	^self transitionAt: key put: (self transitionFor: transition)