classVariables
shouldCacheSessions: aBoolean
	"set the reciver to enable or disable the caching of sessions"
	^ShouldCacheSessions ifNil: [ShouldCacheSessions _ true. ShouldCacheSessions]