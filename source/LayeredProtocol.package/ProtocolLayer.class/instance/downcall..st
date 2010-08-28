stack
downcall: anObject
	"Receive anObject from my high protocol.  The default behaviour is to pass it down unmodified to my low protocol (i.e., I am transparent)."

	down downcall: anObject