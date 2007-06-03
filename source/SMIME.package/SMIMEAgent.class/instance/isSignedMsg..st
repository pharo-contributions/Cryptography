api
isSignedMsg: mailMsg

	^ (self isOpaqueSignedMsg: mailMsg)
		or: [self isMultipartSignedMsg: mailMsg]