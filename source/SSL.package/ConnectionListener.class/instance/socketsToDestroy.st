accessing
socketsToDestroy

	socketsToDestroy == nil ifTrue: [
		socketsToDestroy := OrderedCollection new.
	].
	^socketsToDestroy