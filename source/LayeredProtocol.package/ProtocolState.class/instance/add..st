accessing
add: anAssociation

	^self transitionAt: anAssociation key put: (self transitionFor: anAssociation value)