*ASN1
digestInfoFromMessage: msg

	^ (OrderedCollection 
		with: (OrderedCollection with: self oid with: nil)
		with: (self hashMessage: msg))
