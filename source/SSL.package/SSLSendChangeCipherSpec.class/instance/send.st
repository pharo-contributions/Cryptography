process
send

	| msg |
	msg := SSLChangeCipherSpec new
		type: 1;
		yourself.
	self connection sendChangeCipherSpec: msg.
	self release.
