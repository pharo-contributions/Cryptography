initialize-release
finalize

	"Like #stop, but without the #unregister"

	process ~~ nil ifTrue: [
		process terminate.
	].
	process _ nil.
	self destroySockets.


