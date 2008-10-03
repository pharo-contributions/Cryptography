starting and stopping
stop
	process ~~ nil ifTrue: [
		process terminate.
	].
	process := nil.

	"We do the following in a timely manner instead of relying on
	finalization because we may want to turn right around and start
	listening again.  If an old socket is still around an listening, it may
	interfere with a new one's ability to hear."

	self destroySockets