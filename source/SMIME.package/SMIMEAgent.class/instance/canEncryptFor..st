api
canEncryptFor: recipient

	^ (self certStore atEmail: recipient) notEmpty