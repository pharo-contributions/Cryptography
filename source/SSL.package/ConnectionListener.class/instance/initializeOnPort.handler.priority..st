initialize-release
initializeOnPort: aNumber handler: aBlock priority: pNumber
	portNumber _ aNumber.
	handlerBlock _ aBlock.
	priority _ pNumber.
	socketsToDestroy _ OrderedCollection new