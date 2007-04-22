process
generateMAC: data

	| hash |
	hash := self computeHash: data withKey: self writeKey.
	^ SSLCompressedWithMAC new
		type: data type;
		version: data version;
		length: data length;
		fragment: data fragment;
		mac: hash;
		yourself
