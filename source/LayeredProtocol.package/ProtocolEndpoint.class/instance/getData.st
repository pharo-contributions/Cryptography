server loop
getData
	"Answer a collection of data to be passed up the protocol stack, or nil if the endpoint has failed."

	^self subclassResponsibility