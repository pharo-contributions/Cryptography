services
flushNilCacheValues
	"remove all the cache values that have been nilled out"
	self sessionCache
				associationsDo: [:a | a value isNil
						ifTrue: [self sessionCache removeKey: a key]].