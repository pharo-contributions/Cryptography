parsing
parseFromStream: aStream
	"create server names represented in aStream"
	| anExtension requestStream |
	anExtension _ self new.
	anExtension rawData: (aStream next: (aStream next: 2) asInteger).
	requestStream _ anExtension rawData readStream.
	anExtension statusType: requestStream next.
	anExtension request: (TLSOCSPStatusRequest parseFromStream: requestStream).
	^anExtension