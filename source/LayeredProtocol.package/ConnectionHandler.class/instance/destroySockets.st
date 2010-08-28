initialize-release
destroySockets
	socketsToDestroy ~~ nil ifTrue: [ 
		socketsToDestroy do: [ :ea | ea destroy ].
	].
	socketsToDestroy := OrderedCollection new