accessing
nextPacketsUpToEnd
	| result |
	result := OrderedCollection new.
	[self atEnd] whileFalse: [
		result add: self nextPacket].
	^result