process
verifyMAC: data

	| hash |
	hash := self computeHash: data.
	hash = data mac
		ifFalse: [^ self sendAlertCode: 20].
	^ SSLCompressed new
		type: data type;
		version: data version;
		length: data length;
		fragment: data fragment;
		yourself
