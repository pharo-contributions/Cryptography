process
decrypt: data

	| cipher stream fragment mac |
	stream := ReadStream on: data fragment.
	fragment := stream next: (data length - self hashSize).
	mac := stream next: self hashSize.
	cipher := SSLStreamCipher new
		content: fragment;
		mac: mac;
		yourself.
	data fragment: cipher.
	^ SSLCompressedWithMAC new
		type: data type;
		version: data version;
		length: data length;
		fragment: fragment;
		mac: mac;
		yourself
