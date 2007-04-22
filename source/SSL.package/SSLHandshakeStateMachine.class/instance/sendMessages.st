process
sendMessages

	[self messageSenders isEmpty]
		whileFalse: [self messageSenders removeFirst send].
