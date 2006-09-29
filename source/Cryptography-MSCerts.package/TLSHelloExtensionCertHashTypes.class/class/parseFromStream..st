parsing
parseFromStream: aStream
	"create server names represented in aStream"
	| anExtension |
	anExtension _ self new.
	anExtension rawData: (aStream next: aStream next).
	anExtension hashTypes addAll: anExtension rawData.
	^anExtension