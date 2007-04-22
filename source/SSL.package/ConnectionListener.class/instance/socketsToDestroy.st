accessing
socketsToDestroy

	socketsToDestroy == nil ifTrue: [
		socketsToDestroy _ OrderedCollection new.
	].
	^socketsToDestroy