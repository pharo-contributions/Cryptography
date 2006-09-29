services
closeStore
	| result |
	self hStore ifNil: [^true].
	(result := self certCloseStore: self hStore flags: 0) ifTrue: [self hStore: nil].
	self freeCertContext.
	self certProviderInfo free.
	^result