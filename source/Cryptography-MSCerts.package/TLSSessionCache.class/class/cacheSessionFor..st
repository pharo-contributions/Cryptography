instance creation
cacheSessionFor: aHandShake 
	"cache the handShake and return a sessionID"
	| sessionID |
	self accessProtect
		critical: [self flushNilCacheValues.
			sessionID := self findUnusedSessionFor: aHandShake].
	^sessionID