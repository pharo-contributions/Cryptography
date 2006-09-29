services
findUnusedSessionFor: aHandShake 
	"return the session number of the cached sesssion, 0 if caching is turned off"
	| found aSessionID |
	
	self shouldCacheSessions ifFalse: [^0].
	
	found _ false.
	[aSessionID _ SecureRandom new nextBytes: 32.
	found]
		whileFalse: [self sessionCache
				at: aSessionID
				ifAbsentPut: [found _ true.
					self new sessionID: aSessionID;
						 tlsHandShake: aHandShake;
						 yourself]].
	^ aSessionID