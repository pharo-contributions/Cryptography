protocol
upcallAll: chunk

	| chunkStream |
	chunkStream := chunk readStream.
	self transitionEvent: chunkStream next with: chunkStream.
