process
verifyMAC: data

	^ SSLCompressed new
		type: data type;
		version: data version;
		length: data length;
		fragment: data fragment;
		yourself