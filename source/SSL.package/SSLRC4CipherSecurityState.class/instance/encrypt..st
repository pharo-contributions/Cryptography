as yet unclassified
encrypt: data

	| streamCipher subject encrypted |
	streamCipher := SSLStreamCipher new 
		content: data fragment; 
		mac: data mac; 
		yourself.

	subject := streamCipher asByteArray.
	encrypted := rc4 encrypt: subject.

	^ SSLCiphertext new
		type: data type;
		version: data version;
		length: subject size;
		fragment: encrypted;
		yourself