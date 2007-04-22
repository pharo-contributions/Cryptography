api
waitForConnectionUntil: deadline
	"Wait up until the given deadline for a connection to be established. Return true if it is established by the deadline, false if not."

	[(self conn isConnecting) and: [Time millisecondClockValue < deadline]]
		whileTrue: [
			(Delay forMilliseconds: 100) wait].
	^ self conn isConnected
