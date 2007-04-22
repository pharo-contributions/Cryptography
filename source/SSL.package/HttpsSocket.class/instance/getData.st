api
getData

	| data |
	data := self conn receive.
	[self conn isConnected]
		whileTrue: [
			(Delay forMilliseconds: 100) wait.
			data := data, self conn receive].
	^ data asString