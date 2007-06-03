private
toggleEncrypted

	(SMIMEAgent new canEncryptFor: self to) ifFalse: [^ self].
	self shouldEncrypt: self shouldEncrypt not.
