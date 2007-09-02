process
encodeSignature

	| r s string |
	r := self signature first asByteArrayOfSize: 20.
	s := self signature last asByteArrayOfSize: 20.
	string := self stringOn: (r, s).
	self signature: ((7 asByteArrayOfSize: 4), 'ssh-dss' asByteArray, string).

