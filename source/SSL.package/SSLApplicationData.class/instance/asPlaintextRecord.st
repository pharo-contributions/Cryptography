process
asPlaintextRecord

	^ SSLPlaintext new
		type: 23;
		length: self data size;
		fragment: self data;
		yourself
