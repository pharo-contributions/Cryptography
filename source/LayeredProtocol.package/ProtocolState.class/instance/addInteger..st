accessing
addInteger: anAssociation

	^self transitionAt: anAssociation key asInteger put: (self transitionFor: anAssociation value)