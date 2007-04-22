process
encrypt: data

	^ SSLCiphertext new
		type: data type;
		version: data version;
		length: data length;
		fragment: (SSLStreamCipher new content: data fragment; mac: data mac; yourself);
		yourself