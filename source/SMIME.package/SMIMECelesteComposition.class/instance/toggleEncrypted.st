private
toggleEncrypted

	self to isEmpty ifTrue: [^ self].
	(MailAddressParser addressesIn: self to asString) do: [:e |
		(celeste smimeAgent canEncryptFor: e) ifFalse: [^ self]].
	self shouldEncrypt: self shouldEncrypt not.
