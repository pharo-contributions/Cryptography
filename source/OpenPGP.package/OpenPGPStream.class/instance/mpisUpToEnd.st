accessing
mpisUpToEnd
	| mpis |
	mpis := #().
	[self atEnd] whileFalse: [mpis := mpis copyWith: self nextMPI].
	^mpis