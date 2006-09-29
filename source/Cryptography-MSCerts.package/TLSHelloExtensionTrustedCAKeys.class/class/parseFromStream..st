parsing
parseFromStream: aStream
	"create ca keys represented in aStream"
	| anExtension athorityStream |
	anExtension _ self new.
	anExtension rawData: (aStream next: (aStream next: 2) asInteger).
	athorityStream _ anExtension rawData readStream.
	anExtension trustedAthorities addAll: (TLSTrustedAthority parseFromStream: athorityStream).
	^anExtension