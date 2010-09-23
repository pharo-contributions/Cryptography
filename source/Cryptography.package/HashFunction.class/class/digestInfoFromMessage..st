hashing
digestInfoFromMessage: msg

	^ (OrderedCollection 
		with: (OrderedCollection with: self oid with: nil)
		with: (self hashMessage: msg))
