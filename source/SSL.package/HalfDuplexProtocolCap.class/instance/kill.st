protocol
kill

	self duplexStack isNil ifFalse: [self duplexStack kill].
