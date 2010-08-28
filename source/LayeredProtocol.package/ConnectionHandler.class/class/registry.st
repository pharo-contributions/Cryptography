registry
registry

	Registry == nil ifTrue: [
		Registry := WeakRegistry new
	].
	^Registry