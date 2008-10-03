private
pvtNewListenLoop
	| socket listener |
	listener := self newListener.
	self socketsToDestroy add: listener.	

	"If the listener is not valid then the we cannot use the
	BSD style accept() mechanism."
	listener isValid ifFalse: [^self pvtOldListenLoop].
	[ [ true ] whileTrue: [
		socket := listener waitForAcceptFor: 10 ifTimedOut: [nil].
		(socket notNil and: [ socket isConnected ])
			ifTrue: [
				handlerBlock value: socket.
				socket := nil]
			ifFalse: [
				socket notNil ifTrue: [socket destroy].
				listener isValid
					ifFalse: [(Delay forMilliseconds: 100) wait.
						listener destroy.
						listener := self newListener].
			].
	]	] on: Error do: [ :ex |
			self halt.
			ex pass.
	]