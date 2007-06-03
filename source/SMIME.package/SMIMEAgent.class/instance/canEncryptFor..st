api
canEncryptFor: recipient

	^ (self certStore atEmail: recipient) notNil