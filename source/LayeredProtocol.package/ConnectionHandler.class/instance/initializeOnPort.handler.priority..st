initialize-release
initializeOnPort: aNumber handler: aBlock priority: pNumber
	portNumber := aNumber.
	handlerBlock := aBlock.
	priority := pNumber.
	socketsToDestroy := OrderedCollection new