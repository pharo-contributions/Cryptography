stream - api
peekTag

	| start |
	start := self position.
	^[self nextTag] ensure: [self position: start]