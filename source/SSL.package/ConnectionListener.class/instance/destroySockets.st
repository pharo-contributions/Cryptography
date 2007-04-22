initialize-release
destroySockets
	socketsToDestroy ~~ nil ifTrue: [ 
		socketsToDestroy do: [ :ea | ea destroy ].
	].
	socketsToDestroy _ OrderedCollection new