control
kill

	self sendAlertCode: 0.
	self duplexStack notNil ifTrue: [self duplexStack kill].