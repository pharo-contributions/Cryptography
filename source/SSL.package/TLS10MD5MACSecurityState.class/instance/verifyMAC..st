process
verifyMAC: data

	(self computeHash: data) = data mac
		ifFalse: [^ self sendAlertCode: 20].
	^ SSLCompressed new
		type: data type;
		version: data version;
		length: data length;
		fragment: data fragment;
		yourself
