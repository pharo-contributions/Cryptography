I am a pluggable ProtocolLayer.  You can insert me anywhere in a LayeredProtocol stack.

Communication between protocol stack layers is accomplished using the following messages:

	upcall: datum					-- receive data from the protocol below me in the stack
	downcall: datum					-- receive data from the protocol above me
	flush							-- the protocol below me might become idle for a while
	note: aSymbol with: anObject	-- I am being informed that something "global" has happened

By default I am completely transparent.  In other words I react to the above messages as follows:

	upcall: datum					-- I pass datum on to the protocol above me
	downcall: dataum				-- I pass datum on to the protocol below me
	flush							-- I pass the message to the protocol above me
	note: sym with: obj				-- is ignored entirely

Any or all of these default reactions can be changed by installing blocks which I will execute in response to the above messages.  You install such blocks by sending me the following messages:

	upBlock: unaryBlock			-- evaluated on #up: passing datum as argument
	downBlock: unaryBlock			-- evaluated on #down: passing datum as argument
	flushBlock: aBlock				-- evaulated on #flush with no arguments
	noteBlock: binaryBlock			-- evaulated on #note:with: passing aSym and anObj as arguments

By now you've probably guess that my default behaviour is simply to install the following blocks when I am created:

	upBlock: [:datum | up upcall: datum]
	downBlock: [:datum | down downcall: datum]
	flushBlock: []
	noteBlock: [:aSymbol :anObject | ]

My class knows how to instantiate particular kinds of default behaviour in me, including:

	pass							-- the default (transparency)
	trace							-- prints each datum on the Transcript as it whizzes by
	reflect							-- bounces downward data back up the stack and vice-versa

Here's one example, possibly the shortest known means to create an "echo" server:

	(NetworkEndpoint socket: anAcceptedSocket) asProtocolStack
		push: ProtocolAdaptor reflect;
		install;
		run