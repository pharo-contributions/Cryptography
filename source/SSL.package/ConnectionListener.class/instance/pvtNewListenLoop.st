private
pvtNewListenLoop
	| socket listener |
	listener _ self newListener.
	self socketsToDestroy add: listener.	

	"If the listener is not valid then the we cannot use the
	BSD style accept() mechanism."
	listener isValid ifFalse: [^self pvtOldListenLoop].
	[ [ true ] whileTrue: [
		socket _ listener waitForAcceptFor: 10 ifTimedOut: [nil].
		(socket notNil and: [ socket isConnected ])
			ifTrue: [
				handlerBlock value: socket.
				socket _ nil]
			ifFalse: [
				socket notNil ifTrue: [socket destroy].
				listener isValid
					ifFalse: [(Delay forMilliseconds: 100) wait.
						listener destroy.
						listener _ self newListener].
			].
	]	] on: Error do: [ :ex |
			self halt.
			ex pass.
	]