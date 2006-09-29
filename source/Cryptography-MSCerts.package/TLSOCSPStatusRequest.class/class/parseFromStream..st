parsing
parseFromStream: aStream
	"create request from aStream"
	| aRequest |
	aRequest _ self new.
	aRequest responders addAll: (TLSOCSPResponder parseFromStream: (aStream next: (aStream next: 2) asInteger) readStream).
	aRequest extensions addAll: (TLSOCSPRequestPKIXExtensions parseFromStream: (aStream next: (aStream next: 2) asInteger) readStream).
	^aRequest