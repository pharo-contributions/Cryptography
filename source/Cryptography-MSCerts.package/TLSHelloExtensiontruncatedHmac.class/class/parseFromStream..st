parsing
parseFromStream: aStream
	"create server names represented in aStream"
	| anExtension |
	anExtension _ self new.
	^anExtension