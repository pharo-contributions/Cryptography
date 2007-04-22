process
receive

	| data |
	data := ByteArray new.
	[self pendingReadData isEmpty]
		whileFalse: [data := data, self pendingReadData removeFirst].
	^ data
